import 'package:flutter/material.dart';

class Message {
  final String text;
  final bool isSentByMe;
  final DateTime timestamp;

  Message(this.text, this.isSentByMe, this.timestamp);
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(text, true, DateTime.now()));
      // Simulate received message after 1 second
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add(Message("hai kabar aku baik juga, kamu gimana??", false, DateTime.now()));
        });
      });
    });
    _messageController.clear();
  }

  Widget _buildMessageBubble(Message message) {
    return Align(
      alignment: message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: message.isSentByMe 
            ? Theme.of(context).colorScheme.primary 
            : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: message.isSentByMe 
            ? CrossAxisAlignment.end 
            : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.isSentByMe 
                  ? Colors.white 
                  : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            Text(
              '${message.timestamp.hour}:${message.timestamp.minute}',
              style: TextStyle(
                fontSize: 12,
                color: message.isSentByMe 
                  ? Colors.white70 
                  : Theme.of(context).colorScheme.onSecondary.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage("person.jpeg")),
            const SizedBox(width: 8),
            Text("Isabella", style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  onPressed: () => _sendMessage(_messageController.text),
                  icon: Icon(Icons.send),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}