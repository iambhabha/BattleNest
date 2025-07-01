import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/constants/app_color.dart';
import 'package:tournament_app/features/chat/store/support_chat_store.dart';
import 'package:tournament_app/features/chat/widget/typing_indicator.dart';

class ChannelPage extends StatelessWidget {
  final String? title;

  const ChannelPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StreamChannelHeader(
        title: title != null ? Text(title!, style: TextStyle(fontSize: 13.sp, color: ColorSchemeX.titleColor)) : null,
      ),
      body: Column(
        children: [
          Expanded(child: StreamMessageListView()),
          Observer(
            builder: (context) {
              final supportChatStore = GetIt.I<SupportChatStore>();
              return TypingIndicator(showIndicator: supportChatStore.showTypingIndicator);
            },
          ),

          StreamMessageInput(),
        ],
      ),
    );
  }
}
