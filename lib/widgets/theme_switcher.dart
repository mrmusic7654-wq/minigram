import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  final ThemeMode currentTheme;
  final Function(ThemeMode) onThemeChanged;

  const ThemeSwitcher({
    super.key,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'App Theme',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildThemeOption(
                theme: ThemeMode.light,
                label: 'Light',
                icon: Icons.light_mode,
              ),
              _buildThemeOption(
                theme: ThemeMode.dark,
                label: 'Dark',
                icon: Icons.dark_mode,
              ),
              _buildThemeOption(
                theme: ThemeMode.gold,
                label: 'Gold',
                icon: Icons.diamond,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption({
    required ThemeMode theme,
    required String label,
    required IconData icon,
  }) {
    final isSelected = currentTheme == theme;
    
    return GestureDetector(
      onTap: () => onThemeChanged(theme),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? _getThemeColor(theme) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? _getThemeColor(theme) : Colors.grey[700]!,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : _getThemeColor(theme),
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getThemeColor(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
        return Colors.white;
      case ThemeMode.dark:
        return const Color(0xFF00f3ff);
      case ThemeMode.gold:
        return const Color(0xFFF7931A);
    }
  }
}