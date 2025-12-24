import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey[900],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/1.jpg',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '+1 234 567 8900',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildListTile(
                  icon: Icons.person,
                  title: 'Account',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.lock,
                  title: 'Privacy & Security',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.chat,
                  title: 'Chat Settings',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.storage,
                  title: 'Storage & Data',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.help,
                  title: 'Help',
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.logout,
                  title: 'Log Out',
                  color: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.grey),
        title: Text(
          title,
          style: TextStyle(
            color: color ?? Colors.white,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}