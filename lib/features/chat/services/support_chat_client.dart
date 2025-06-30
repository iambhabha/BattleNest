import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SupportChatClient {
  final StreamChatClient _client;

  SupportChatClient(String apiKey)
    : _client = StreamChatClient(apiKey, logLevel: Level.INFO);

  StreamChatClient get client => _client;

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
  }

  Future<String> fetchStreamToken(String userId) async {
    final url = Uri.parse('http://192.168.1.34:5000/generate-token');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"userId": userId}),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["token"];
    } else {
      throw Exception("Failed to fetch token");
    }
  }

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

  Future<void> reconnectUser(String userId) async {
    await client.disconnectUser();
    await connectUser(userId);
  }

  Future<void> disconnectUser() async {
    await _client.disconnectUser();
  }
}
