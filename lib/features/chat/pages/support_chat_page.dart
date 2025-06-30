import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SupportChatPage extends StatefulWidget {
  final String userId;

  const SupportChatPage({super.key, required this.userId});

  @override
  State<SupportChatPage> createState() => _SupportChatPageState();
}

class _SupportChatPageState extends State<SupportChatPage> {
  late final StreamChatClient client;
  Channel? currentChannel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initChat();
  }

  Future<String> fetchStreamToken(String userId) async {
    final url = Uri.parse('http://192.168.1.34:5000/generate-token');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"userId": userId}),
    );

    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["token"];
    } else {
      throw Exception("Failed to fetch token");
    }
  }

  Future<void> initChat() async {
    client = StreamChatClient('dukn7eu68wzr', logLevel: Level.INFO);
    final token = await fetchStreamToken(widget.userId);
    await client.connectUser(User(id: 'user123'), token);

    await client.updateUser(
      User(id: 'support_agent_1', extraData: {'name': 'Support Agent'}),
    );

    final channel = client.channel(
      'messaging',
      id: 'support_channel_user123',
      extraData: {
        'members': ['user123', 'support_agent_1'],
      },
    );

    await channel.watch();

    await currentChannel!.watch();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    client.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading || currentChannel == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return StreamChat(
      client: client,
      child: StreamChannel(
        channel: currentChannel!,
        child: Scaffold(
          appBar: const StreamChannelHeader(),
          body: Column(
            children: const [
              Expanded(child: StreamMessageListView()),
              StreamMessageInput(),
            ],
          ),
        ),
      ),
    );
  }
}
