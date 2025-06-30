import 'package:mobx/mobx.dart';
import 'package:stream_chat/stream_chat.dart';

import '../services/support_chat_client.dart';
import 'base_store.dart';

part 'support_chat_store.g.dart';

class SupportChatStore = _SupportChatStore with _$SupportChatStore;

abstract class _SupportChatStore extends BaseStore with Store {
  final SupportChatClient supportClient;

  _SupportChatStore(this.supportClient);

  Channel? currentChannel;

  @observable
  bool connected = false;

  @action
  Future<void> init(String userId) async {
    setLoading(true);
    await supportClient.connectUser(userId);
    currentChannel = await supportClient.createSupportChannel(
      userId,
      'support_agent_1',
    );
    connected = true;
    setLoading(false);
  }

  StreamChatClient get client => supportClient.client;
}
