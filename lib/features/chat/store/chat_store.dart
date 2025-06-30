import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'base_store.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore extends BaseStore with Store {
  final StreamChatClient client;

  _ChatStore(this.client);

  Channel? currentChannel;

  @observable
  bool connected = false;

  @action
  Future<void> connectUser(String userId) async {
    try {
      setLoading(true);

      await client.connectUser(
        User(id: userId, name: "User $userId"),
        client.devToken(userId).rawValue,
      );

      connected = true;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> createOrJoinSupportChannel(String userId) async {
    currentChannel = client.channel(
      'messaging',
      id: 'support-$userId',
      extraData: {
        'members': [userId, 'support_agent_1'],
      },
    );
    await currentChannel!.watch();
  }
}
