import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/env/env.dart';

import '../services/support_chat_client.dart';

part 'support_chat_store.g.dart';

class SupportChatStore = _SupportChatStore with _$SupportChatStore;

abstract class _SupportChatStore with Store {
  final SupportChatClient supportClient = SupportChatClient(Env.config.streamKey);

  @observable
  bool isLoading = false;

  @observable
  Channel? currentChannel; // leave the field as is

  @observable
  bool connected = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  Future<void> init(String userId) async {
    try {
      setLoading(true);

      final client = supportClient.client;
      final userToken = await supportClient.fetchStreamToken(userId);

      // This automatically creates the user in dev mode
      await client.connectUser(
        User(id: userId, name: 'User $userId'),
        userToken, // This must be a dev token or valid backend-generated token
      );

      // Now create or get the channel
      currentChannel = client.channel(
        'messaging',
        id: 'support_$userId',
        extraData: {
          'members': ['support_admin', userId],
        },
      );

      await currentChannel?.watch();
      connected = true;
    } catch (e) {
      print('Error during chat init: $e');
      connected = false;
      currentChannel = null;
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> dispose() async {
    await supportClient.disconnectUser();
    connected = false;
    currentChannel = null;
  }

  StreamChatClient get client => supportClient.client;
}
