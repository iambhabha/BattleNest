import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/core/di/setup_locator.dart';

import '../store/support_chat_store.dart';

class SupportChatPage extends StatefulWidget {
  final String userId;

  const SupportChatPage({super.key, required this.userId});

  @override
  State<SupportChatPage> createState() => _SupportChatPageState();
}

class _SupportChatPageState extends State<SupportChatPage> {
  final SupportChatStore store = getIt<SupportChatStore>();

  @override
  void initState() {
    super.initState();
    store.init(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.isLoading || store.currentChannel == null) {
          return const _ShimmerLoadingScreen();
        }

        return StreamChat(
          client: store.client,
          child: StreamChannel(
            channel: store.currentChannel!,
            child: Scaffold(
              appBar: const StreamChannelHeader(),
              body: Column(
                children: [
                  Expanded(child: StreamMessageListView()),
                  StreamMessageInput(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ShimmerLoadingScreen extends StatelessWidget {
  const _ShimmerLoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loading Chat...")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            children: List.generate(6, (i) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                height: 20,
                color: Colors.white,
              );
            }),
          ),
        ),
      ),
    );
  }
}
