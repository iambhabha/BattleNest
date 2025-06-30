import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../services/support_chat_client.dart';

part 'support_chat_store.g.dart';

class SupportChatStore = _SupportChatStore with _$SupportChatStore;

abstract class _SupportChatStore with Store {
  final SupportChatClient supportClient = SupportChatClient('dukn7eu68wzr');

  @observable
  bool isLoading = false;

  @observable
  Channel? currentChannel;

  @observable
  bool connected = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  Future<void> init(String userId) async {
    setLoading(true);

    // Only connect if the user is not already connected
    if (supportClient.client.state.currentUser?.id != userId) {
      try {
        await supportClient.connectUser(userId);
      } catch (e) {
        print('Error connecting user: $e');
        // handle or rethrow if needed
      }
    } else {
      print('User $userId already connected, skipping connectUser');
    }

    currentChannel = await supportClient.createSupportChannel(
      userId,
      'support_agent_1',
    );

    connected = true;
    setLoading(false);
  }

  @action
  Future<void> dispose() async {
    await supportClient.disconnectUser();
    connected = false;
    currentChannel = null;
  }

  StreamChatClient get client => supportClient.client;
}
