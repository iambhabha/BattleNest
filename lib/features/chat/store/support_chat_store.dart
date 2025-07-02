import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import '../services/support_chat_client.dart';

part 'support_chat_store.g.dart';

class SupportChatStore = _SupportChatStore with _$SupportChatStore;

abstract class _SupportChatStore with Store {
  @observable
  bool isLoading = false;

  @observable
  Channel? currentChannel;

  @observable
  bool connected = false;

  @observable
  bool showTypingIndicator = false;

  final SupportChatClient streamClient = GetIt.I<SupportChatClient>();

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void setTyping(bool value) => showTypingIndicator = value;

  @action
  Future<void> init(String userId) async {
    try {
      setLoading(true);

      final userToken = await streamClient.fetchStreamToken(userId);

      // Connect user to the chat service
      await streamClient.client.connectUser(
        User(
          id: userId,
          name: 'Arvind',
          image:
              'https://image.api.playstation.com/vulcan/ap/rnd/202308/1722/15f4ab1e0fe6a37609b164362a653c0e5bcee98a861d0f10.png',
          online: true,
          role: 'user',
        ),
        userToken, // This must be a dev token or valid backend-generated token
      );

      // Create or get the channel
      currentChannel = streamClient.client.channel(
        'messaging',
        id: 'support_$userId',
        extraData: {
          'members': ['support_admin', userId],
        },
      );

      await currentChannel?.watch();
      connected = true;

      // Setup event listeners for typing
      _setupTypingListeners();
    } catch (e) {
      print('Error during chat init: $e');
      connected = false;
      currentChannel = null;
    } finally {
      setLoading(false);
    }
  }

  void _setupTypingListeners() {
    currentChannel?.on('typing.start').listen((event) {
      final isCurrentUserTyping = event.isLocal;
      if (!isCurrentUserTyping) {
        setTyping(true);
      }
    });

    currentChannel?.on('typing.stop').listen((event) {
      final isCurrentUserTyping = event.isLocal;
      if (!isCurrentUserTyping) {
        setTyping(false);
      }
    });
  }

  @action
  Future<void> dispose() async {
    await streamClient.disconnectUser();
    connected = false;
    currentChannel = null;
  }

  StreamChatClient get client => streamClient.client;
}
