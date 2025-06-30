import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/env/env.dart';

import '../services/support_chat_client.dart';

part 'support_chat_store.g.dart';

class SupportChatStore = _SupportChatStore with _$SupportChatStore;

abstract class _SupportChatStore with Store {
  final SupportChatClient supportClient = SupportChatClient(
    Env.config.streamKey,
  );

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
      final token = await supportClient.fetchStreamToken(userId);

      await client.connectUser(User(id: userId, name: 'Support User'), token);

      currentChannel = client.channel('messaging', id: 'support_$userId');

      await currentChannel!.watch();

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
