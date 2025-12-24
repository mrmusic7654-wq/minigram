// lib/screens/chat_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../widgets/circuit_background.dart';
import '../widgets/glass_card.dart';
import '../theme/theme_manager.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>();
    final appState = context.watch<AppState>();
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const Positioned.fill(
            child: CircuitBackground(theme: ThemeMode.gold),
          ),
          
          Column(
            children: [
              // Header
              GlassCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12,
                ),
                color: Colors.black.withOpacity(0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Minigram',
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: [
                        _buildIconButton(Icons.camera_alt_outlined, theme),
                        const SizedBox(width: 16),
                        _buildIconButton(Icons.search, theme),
                        const SizedBox(width: 16),
                        _buildIconButton(Icons.more_vert, theme),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Tabs
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  border: Border(
                    bottom: BorderSide(
                      color: theme.primaryColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    _buildAIBadge(),
                    Expanded(
                      child: Row(
                        children: [
                          _buildTab('CHATS', 0, theme, appState.totalUnread),
                          _buildTab('STATUS', 1, theme, 0),
                          _buildTab('CALLS', 2, theme, 0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Chat List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: appState.chats.length,
                  itemBuilder: (context, index) {
                    final chat = appState.chats[index];
                    return _buildChatItem(chat, theme);
                  },
                ),
              ),
            ],
          ),
          
          // FAB
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: theme.primaryColor,
              onPressed: () {},
              child: Icon(
                Icons.message_outlined,
                color: Colors.black,
                size: 28,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildIconButton(IconData icon, ThemeManager theme) {
    return IconButton(
      icon: Icon(icon),
      color: Colors.grey[300],
      hoverColor: theme.primaryColor,
      onPressed: () {},
    );
  }
  
  Widget _buildAIBadge() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            'AI',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildTab(String label, int index, ThemeManager theme, int badgeCount) {
    final isActive = index == 0; // Simplified for example
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? theme.primaryColor : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isActive ? theme.primaryColor : Colors.grey[400],
                    letterSpacing: 1,
                  ),
                ),
                if (label == 'CHATS' && badgeCount > 0) ...[
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badgeCount.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildChatItem(Chat chat, ThemeManager theme) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/chat/${chat.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.05),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: theme.primaryColor.withOpacity(0.2),
                      width: 1,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(chat.avatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (chat.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            
            const SizedBox(width: 16),
            
            // Chat Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chat.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _formatTime(chat.lastMessage.timestamp),
                        style: TextStyle(
                          fontSize: 12,
                          color: chat.unreadCount > 0 
                            ? theme.primaryColor 
                            : Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 4),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          chat.lastMessage.type == 'voice'
                            ? '🎤 Voice Message'
                            : chat.lastMessage.text,
                          style: TextStyle(
                            fontSize: 14,
                            color: chat.unreadCount > 0
                              ? Colors.grey[200]
                              : Colors.grey[500],
                            fontWeight: chat.unreadCount > 0
                              ? FontWeight.w500
                              : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      if (chat.unreadCount > 0)
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              chat.unreadCount.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  String _formatTime(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

// Simplified Chat Model
class Chat {
  final String id;
  final String name;
  final String avatar;
  final bool isOnline;
  final int unreadCount;
  final Message lastMessage;
  
  Chat({
    required this.id,
    required this.name,
    required this.avatar,
    this.isOnline = false,
    required this.unreadCount,
    required this.lastMessage,
  });
}

class Message {
  final String text;
  final int timestamp;
  final String type;
  
  Message({
    required this.text,
    required this.timestamp,
    required this.type,
  });
}