import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SupportChatClient {
  final StreamChatClient _client;

  SupportChatClient(String apiKey)
    : _client = StreamChatClient(apiKey, logLevel: Level.INFO);

  StreamChatClient get client => _client;

  Future<void> connectUser(String userId) async {
    await _client.connectUser(
      User(id: userId, name: "User $userId"),
      _client.devToken(userId).rawValue,
    );
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

  Future<void> disconnectUser() async {
    await _client.disconnectUser();
  }
}
