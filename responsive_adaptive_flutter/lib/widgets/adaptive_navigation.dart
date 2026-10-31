import 'package:flutter/material.dart';

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.isDesktop,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool isDesktop;

  static const _destinations = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.dashboard_outlined),
      selectedIcon: Icon(Icons.dashboard),
      label: 'Tổng quan',
    ),
    NavigationDestination(
      icon: Icon(Icons.task_alt_outlined),
      selectedIcon: Icon(Icons.task_alt),
      label: 'Công việc',
    ),
    NavigationDestination(
      icon: Icon(Icons.analytics_outlined),
      selectedIcon: Icon(Icons.analytics),
      label: 'Thống kê',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: 'Cài đặt',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final destinations = _destinations
        .map(
          (item) => NavigationRailDestination(
            icon: item.icon,
            selectedIcon: item.selectedIcon,
            label: Text(item.label),
          ),
        )
        .toList();

    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      extended: isDesktop,
      // Khi extended=true, labelType phải để null.
      labelType: isDesktop ? null : NavigationRailLabelType.all,
      minWidth: 76,
      minExtendedWidth: 220,
      destinations: destinations,
    );
  }
}
