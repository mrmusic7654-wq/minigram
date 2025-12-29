import 'package:flutter/material.dart';
import 'package:minigram/screens/chat_list_screen.dart';
import 'package:minigram/screens/groups_screen.dart';
import 'package:minigram/screens/discover_screen.dart';
import 'package:minigram/screens/calls_screen.dart';
import 'package:minigram/screens/profile_screen.dart';
import 'package:minigram/widgets/bottom_nav_bar.dart';
import 'package:minigram/widgets/circuit_background.dart';
import 'package:minigram/widgets/glass_card.dart';
import 'package:minigram/theme/app_theme.dart';
import 'package:minigram/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  
  // List of screens
  final List<Widget> _screens = [
    const ChatListScreen(),
    const GroupsScreen(),
    const DiscoverScreen(),
    const CallsScreen(),
    const ProfileScreen(),
  ];
  
  // List of screen titles
  final List<String> _screenTitles = [
    'Chats',
    'Groups',
    'Discover',
    'Calls',
    'Profile',
  ];
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _screens.length, vsync: this);
    _tabController.addListener(_handleTabChange);
  }
  
  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentIndex = _tabController.index;
      });
    }
  }
  
  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }
  
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);
    
    return Scaffold(
      // Circuit-themed background
      body: Stack(
        children: [
          // Animated circuit background
          CircuitBackground(
            color: theme.primaryColor.withOpacity(0.1),
            animationSpeed: 1.5,
          ),
          
          // Main content
          Column(
            children: [
              // Custom AppBar
              _buildAppBar(themeProvider, theme),
              
              // Screen content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _screens,
                ),
              ),
            ],
          ),
        ],
      ),
      
      // Custom bottom navigation bar
      bottomNavigationBar: GlassCard(
        child: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavBarItem(
              icon: Icons.chat_bubble_outline,
              activeIcon: Icons.chat_bubble,
              label: 'Chats',
            ),
            BottomNavBarItem(
              icon: Icons.group_outlined,
              activeIcon: Icons.group,
              label: 'Groups',
            ),
            BottomNavBarItem(
              icon: Icons.explore_outlined,
              activeIcon: Icons.explore,
              label: 'Discover',
            ),
            BottomNavBarItem(
              icon: Icons.call_outlined,
              activeIcon: Icons.call,
              label: 'Calls',
            ),
            BottomNavBarItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              label: 'Profile',
            ),
          ],
        ),
      ),
      
      // Floating Action Button for new chat
      floatingActionButton: _currentIndex == 0 ? _buildFAB(theme) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  
  Widget _buildAppBar(ThemeProvider themeProvider, ThemeData theme) {
    return GlassCard(
      margin: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App title with theme switcher
            Row(
              children: [
                // App logo/icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.primaryColor,
                        theme.primaryColor.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.bolt,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // App title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Minigram',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.primaryColor,
                      ),
                    ),
                    Text(
                      _screenTitles[_currentIndex],
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Action buttons
            Row(
              children: [
                // Search button
                IconButton(
                  onPressed: _onSearchPressed,
                  icon: Icon(
                    Icons.search,
                    color: theme.iconColor,
                  ),
                  tooltip: 'Search',
                ),
                
                // Theme switcher
                IconButton(
                  onPressed: () => themeProvider.toggleTheme(),
                  icon: Icon(
                    theme.brightness == Brightness.dark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    color: theme.iconColor,
                  ),
                  tooltip: 'Switch theme',
                ),
                
                // More options
                PopupMenuButton<String>(
                  onSelected: _onMenuSelected,
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'new_group',
                      child: Row(
                        children: [
                          Icon(Icons.group_add, size: 20),
                          SizedBox(width: 8),
                          Text('New Group'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'new_channel',
                      child: Row(
                        children: [
                          Icon(Icons.campaign, size: 20),
                          SizedBox(width: 8),
                          Text('New Channel'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'contacts',
                      child: Row(
                        children: [
                          Icon(Icons.contacts, size: 20),
                          SizedBox(width: 8),
                          Text('Contacts'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'settings',
                      child: Row(
                        children: [
                          Icon(Icons.settings, size: 20),
                          SizedBox(width: 8),
                          Text('Settings'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'help',
                      child: Row(
                        children: [
                          Icon(Icons.help_outline, size: 20),
                          SizedBox(width: 8),
                          Text('Help & Feedback'),
                        ],
                      ),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_vert,
                    color: theme.iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFAB(ThemeData theme) {
    return FloatingActionButton(
      onPressed: _onNewChatPressed,
      backgroundColor: theme.primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.edit, size: 24),
    );
  }
  
  void _onSearchPressed() {
    // Show search dialog
    showSearch(
      context: context,
      delegate: _MinigramSearchDelegate(),
    );
  }
  
  void _onNewChatPressed() {
    // Navigate to new chat screen
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'New Chat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('New Contact'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to add contact
                },
              ),
              ListTile(
                leading: const Icon(Icons.group_add),
                title: const Text('New Group'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to create group
                },
              ),
              ListTile(
                leading: const Icon(Icons.campaign),
                title: const Text('New Channel'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to create channel
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }
  
  void _onMenuSelected(String value) {
    switch (value) {
      case 'new_group':
        // Navigate to create group
        break;
      case 'new_channel':
        // Navigate to create channel
        break;
      case 'contacts':
        // Navigate to contacts
        break;
      case 'settings':
        // Navigate to settings
        break;
      case 'help':
        // Show help
        break;
    }
  }
}

// Custom search delegate
class _MinigramSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        'Search results for: $query',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? ['Recent chats', 'Contacts', 'Groups', 'Messages']
        : ['Chats with "$query"', 'Contacts matching "$query"', 'Messages containing "$query"'];
    
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.search),
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: theme.scaffoldBackgroundColor,
        foregroundColor: theme.iconColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.textTheme.titleMedium?.copyWith(
          color: theme.hintColor,
        ),
        border: InputBorder.none,
      ),
    );
  }
}

// Extension for theme
extension ThemeExtension on ThemeData {
  Color get iconColor => brightness == Brightness.dark
      ? Colors.white70
      : Colors.black87;
}
