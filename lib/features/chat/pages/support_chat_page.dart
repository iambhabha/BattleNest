import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/features/chat/pages/channel_page.dart';
import 'package:tournament_app/features/chat/store/support_chat_store.dart';

class SupportChatPage extends StatefulWidget {
  final String userId;

  const SupportChatPage({super.key, required this.userId});

  @override
  State<SupportChatPage> createState() => _SupportChatPageState();
}

class _SupportChatPageState extends State<SupportChatPage> {
  final _supportChatStore = GetIt.I<SupportChatStore>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => initChat());
  }

  Future<void> initChat() async {
    await _supportChatStore.init(widget.userId);
  }

  @override
  void dispose() {
    _supportChatStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (_supportChatStore.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_supportChatStore.currentChannel == null) {
          return const Center(child: Text('Failed to connect to chat.'));
        }

        return StreamChat(
          client: _supportChatStore.client,
          child: StreamChannel(channel: _supportChatStore.currentChannel!, child: ChannelPage(title: 'Support Chat')),
        );
      },
    );
  }
}
