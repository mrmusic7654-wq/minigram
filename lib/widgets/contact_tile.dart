import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String? status;
  final String avatarUrl;
  final bool isOnline;
  final bool isSelected;
  final VoidCallback? onTap;

  const ContactTile({
    super.key,
    required this.name,
    this.status,
    required this.avatarUrl,
    this.isOnline = false,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
            radius: 24,
          ),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: status != null
          ? Text(
              status!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
          : null,
      trailing: isSelected
          ? const Icon(
              Icons.check_circle,
              color: Color(0xFFF7931A),
            )
          : null,
      onTap: onTap,
    );
  }
}