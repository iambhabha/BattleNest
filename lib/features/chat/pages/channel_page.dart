import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:tournament_app/constants/app_color.dart';

class ChannelPage extends StatelessWidget {
  final String? title;

  const ChannelPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StreamChannelHeader(
        showTypingIndicator: true,
        centerTitle: true,
        title: title != null ? Text(title!, style: TextStyle(fontSize: 13.sp, color: ColorSchemeX.titleColor)) : null,
      ),
      body: Column(children: const [Expanded(child: StreamMessageListView()), StreamMessageInput()]),
    );
  }
}
