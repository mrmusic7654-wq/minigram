import 'package:flutter/material.dart';
import 'package:minigram/models/message.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  
  const ChatScreen({super.key, required this.chatId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [
    Message(
      id: '1',
      chatId: '1',
      senderId: 'other',
      type: MessageType.text,
      text: 'Hello there!',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    Message(
      id: '2',
      chatId: '1',
      senderId: 'me',
      type: MessageType.text,
      text: 'Hi! How are you?',
      timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
    ),
    Message(
      id: '3',
      chatId: '1',
      senderId: 'other',
      type: MessageType.voice,
      text: 'Voice message',
      duration: 30,
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/1.jpg',
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alice Johnson',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }
  
  Widget _buildMessageBubble(Message message) {
    final isMe = message.isMe;
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe 
            ? MainAxisAlignment.end 
            : MainAxisAlignment.start,
        children: [
          if (!isMe)
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/1.jpg',
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            margin: EdgeInsets.only(
              left: isMe ? 0 : 8,
              right: isMe ? 8 : 0,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isMe 
                  ? const Color(0xFFF7931A) 
                  : Colors.grey[800],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: isMe 
                    ? const Radius.circular(16) 
                    : const Radius.circular(4),
                bottomRight: isMe 
                    ? const Radius.circular(4) 
                    : const Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.type == MessageType.voice)
                  Row(
                    children: [
                      Icon(
                        Icons.mic,
                        color: isMe ? Colors.black : Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${message.duration}s',
                        style: TextStyle(
                          color: isMe ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    message.text,
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                    ),
                  ),
                const SizedBox(height: 4),
                Text(
                  '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: isMe ? Colors.black54 : Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[900],
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.grey),
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[800],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              if (_messageController.text.isNotEmpty) {
                _sendMessage(_messageController.text);
                _messageController.clear();
              }
            },
            icon: const Icon(
              Icons.send,
              color: Color(0xFFF7931A),
            ),
          ),
        ],
      ),
    );
  }
  
  void _sendMessage(String text) {
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: widget.chatId,
      senderId: 'me',
      type: MessageType.text,
      text: text,
      timestamp: DateTime.now(),
    );
    
    setState(() {
      _messages.add(newMessage);
    });
  }
}