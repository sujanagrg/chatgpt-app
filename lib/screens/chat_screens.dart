//This is the main chatscreen with the bot.
import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _istyping = true;
  late TextEditingController
      textEditingController; //This should be initialized otherwise you will face initialization error
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        title: const Text("ChatGPT"),
        actions: [
          IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Row();
                    });
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatMessages[index]["msg"].toString(),
                    chatIndex:
                        int.parse(chatMessages[index]["chatIndex"].toString()),
                  );
                }),
          ),
          if (_istyping) ...[
            // Spread operator to use multiple widgets in a column
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              color: cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: textEditingController,
                        onSubmitted: (value) {
                          //Todo
                        },
                        decoration: InputDecoration.collapsed(
                            hintText: "How may I help you",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ]
        ],
      )),
    );
  }
}
