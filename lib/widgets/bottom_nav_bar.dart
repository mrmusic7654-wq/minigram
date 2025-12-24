// lib/widgets/bottom_nav_bar.dart
enum NavItem {
  chats,
  groups,
  discover,
  calls,
  profile,
}

class BottomNavBar extends StatelessWidget {
  final NavItem current;
  final Function(NavItem) onTap;

  const BottomNavBar({
    super.key,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.8),
        border: Border(
          top: BorderSide(
            color: theme.primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: Icons.chat_bubble_outline,
            activeIcon: Icons.chat_bubble,
            label: 'CHATS',
            item: NavItem.chats,
          ),
          _buildNavItem(
            context,
            icon: Icons.group_outlined,
            activeIcon: Icons.group,
            label: 'GROUPS',
            item: NavItem.groups,
          ),
          _buildNavItem(
            context,
            icon: Icons.explore_outlined,
            activeIcon: Icons.explore,
            label: 'DISCOVER',
            item: NavItem.discover,
          ),
          _buildNavItem(
            context,
            icon: Icons.call_outlined,
            activeIcon: Icons.call,
            label: 'CALLS',
            item: NavItem.calls,
          ),
          _buildNavItem(
            context,
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'PROFILE',
            item: NavItem.profile,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required NavItem item,
  }) {
    final isActive = current == item;
    final theme = Theme.of(context);
    
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(item),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive 
                ? theme.primaryColor 
                : theme.unselectedWidgetColor,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Orbitron',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: isActive 
                  ? theme.primaryColor 
                  : theme.unselectedWidgetColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
