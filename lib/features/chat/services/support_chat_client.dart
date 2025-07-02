import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SupportChatClient {
  final StreamChatClient _client;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  SupportChatClient(String apiKey)
    : _client = StreamChatClient(apiKey, logLevel: Level.INFO);

  StreamChatClient get client => _client;

  // Connect user to Stream Chat
  Future<void> connectUser(String userId) async {
    if (client.state.currentUser?.id == userId) {
      print("User $userId already connected.");
      return; // Already connected, no need to reconnect.
    }

    final token = await fetchStreamToken(userId);
    await client.connectUser(
      User(id: userId, extraData: {"name": "User $userId"}),
      token,
    );

    // Once user is connected to Stream Chat, register device for push notifications
    await addDevice(userId);
  }

  // Fetch Stream token (this could be from your backend)
  Future<String> fetchStreamToken(String userId) async {
    return dotenv.env['STREAM_TOKEN'] ?? '';
  }

  // Add Firebase device token for push notifications
  Future<void> addDevice(String userId) async {
    try {
      // Get Firebase device token
      final deviceToken = await _firebaseMessaging.getToken();
      if (deviceToken != null) {
        // Add the device token to Stream Chat for the user
        await client.addDevice(deviceToken, PushProvider.firebase);
        print("Device registered with Stream Chat for user $userId");
      } else {
        print("No Firebase device token found.");
      }
    } catch (e) {
      print("Failed to add device token: $e");
    }
  }

  // Create a support channel between the user and the agent
  Future<Channel> createSupportChannel(String userId, String agentId) async {
    final channel = _client.channel(
      'messaging',
      id: 'support-$userId',
      extraData: {
        'members': [userId, agentId],
      },
    );
    await channel.watch();
    return channel;
  }

  // Reconnect user to Stream Chat
  Future<void> reconnectUser(String userId) async {
    await client.disconnectUser();
    await connectUser(userId);
  }

  // Disconnect user from Stream Chat
  Future<void> disconnectUser() async {
    await _client.disconnectUser();
  }
}
