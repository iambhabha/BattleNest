import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/env/env.dart';

import '../services/support_chat_client.dart';

part 'support_chat_store.g.dart';

class SupportChatStore = _SupportChatStore with _$SupportChatStore;

abstract class _SupportChatStore with Store {
  @observable
  bool isLoading = false;

  @observable
  Channel? currentChannel; // leave the field as is

  @observable
  bool connected = false;

  @action
  void setLoading(bool value) => isLoading = value;

  final streamClient = GetIt.I<SupportChatClient>();

  @action
  Future<void> init(String userId) async {
    try {
      final streamClient = GetIt.I<SupportChatClient>();
      setLoading(true);

      final userToken = await streamClient.fetchStreamToken(userId);
      // This automatically creates the user in dev mode
      await streamClient.client.connectUser(
        User(
          id: userId,
          name: 'Kapil Sharma',
          image:
              'https://image.api.playstation.com/vulcan/ap/rnd/202308/1722/15f4ab1e0fe6a37609b164362a653c0e5bcee98a861d0f10.png',
          online: true,
          role: 'user',
        ),
        userToken, // This must be a dev token or valid backend-generated token
      );

      // Now create or get the channel
      currentChannel = streamClient.client.channel(
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
    await streamClient.disconnectUser();
    connected = false;
    currentChannel = null;
  }

  StreamChatClient get client => streamClient.client;
}
