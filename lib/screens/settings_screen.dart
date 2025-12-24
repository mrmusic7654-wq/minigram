import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xFFF7931A),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          _buildSectionHeader('Appearance'),
          _buildThemeOption(),
          _buildSectionHeader('Privacy'),
          _buildPrivacyOption('Last Seen & Online', Icons.visibility),
          _buildPrivacyOption('Profile Photo', Icons.photo),
          _buildPrivacyOption('Calls', Icons.call),
          _buildSectionHeader('Chats'),
          _buildChatOption('Theme', Icons.color_lens),
          _buildChatOption('Wallpaper', Icons.wallpaper),
          _buildChatOption('Chat Backup', Icons.backup),
          _buildSectionHeader('Data & Storage'),
          _buildStorageOption('Storage Usage', Icons.storage),
          _buildStorageOption('Network Usage', Icons.network_check),
          _buildStorageOption('Auto-Download', Icons.download),
          _buildSectionHeader('Support'),
          _buildSupportOption('Help Center', Icons.help),
          _buildSupportOption('Contact Us', Icons.contact_support),
          _buildSupportOption('App Info', Icons.info),
        ],
      ),
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  
  Widget _buildThemeOption() {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.dark_mode, color: Colors.grey),
        title: const Text(
          'Theme',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: const Text(
          'System Default',
          style: TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
  
  Widget _buildPrivacyOption(String title, IconData icon) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
  
  Widget _buildChatOption(String title, IconData icon) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
  
  Widget _buildStorageOption(String title, IconData icon) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
  
  Widget _buildSupportOption(String title, IconData icon) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}