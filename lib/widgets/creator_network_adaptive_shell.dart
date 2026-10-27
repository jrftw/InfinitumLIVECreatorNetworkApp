/*
 * Filename: creator_network_adaptive_shell.dart
 * Purpose: Native hub chrome — Cupertino tabs on iOS, Material 3 bar on Android, rail on web
 * Author: Kevin Doyle Jr. / Infinitum Imagery LLC
 * Last Modified: 2026-10-27
 * Dependencies: flutter/material.dart, flutter/cupertino.dart, platform_util.dart, logger.dart
 * Platform Compatibility: iOS, Android, Web
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinitum_live_creator_network/utils/platform_util.dart';

// MARK: - Tab Destination Model
class CreatorNetworkAdaptiveDestination {
  final String label;
  final IconData materialIcon;
  final IconData materialSelectedIcon;
  final IconData cupertinoIcon;

  const CreatorNetworkAdaptiveDestination({
    required this.label,
    required this.materialIcon,
    required this.materialSelectedIcon,
    required this.cupertinoIcon,
  });
}

// MARK: - Adaptive Hub Shell
class CreatorNetworkAdaptiveShell extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<Widget> pages;
  final List<CreatorNetworkAdaptiveDestination> destinations;

  const CreatorNetworkAdaptiveShell({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.pages,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    final Widget stack = IndexedStack(
      index: selectedIndex,
      children: pages,
    );

    if (PlatformUtil.creatorNetworkIsWideWebLayout(context)) {
      return _creatorNetworkWebRailScaffold(
        context: context,
        stack: stack,
      );
    }

    if (PlatformUtil.isIOS) {
      return Scaffold(
        body: stack,
        bottomNavigationBar: _creatorNetworkIosTabBar(context),
      );
    }

    return Scaffold(
      body: stack,
      bottomNavigationBar: _creatorNetworkMaterialNavBar(context),
    );
  }

  // MARK: - iOS Cupertino Tab Bar
  Widget _creatorNetworkIosTabBar(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: selectedIndex,
      onTap: onDestinationSelected,
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveColor: CupertinoColors.systemGrey,
      backgroundColor: CupertinoTheme.of(context)
          .barBackgroundColor
          .withValues(alpha: 0.92),
      border: const Border(
        top: BorderSide(color: Color(0x4D3C3C43), width: 0.33),
      ),
      items: [
        for (final CreatorNetworkAdaptiveDestination destination
            in destinations)
          BottomNavigationBarItem(
            icon: Icon(destination.cupertinoIcon),
            label: destination.label,
          ),
      ],
    );
  }

  // MARK: - Android / narrow web Material Navigation Bar
  Widget _creatorNetworkMaterialNavBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      destinations: [
        for (final CreatorNetworkAdaptiveDestination destination
            in destinations)
          NavigationDestination(
            icon: Icon(destination.materialIcon),
            selectedIcon: Icon(destination.materialSelectedIcon),
            label: destination.label,
          ),
      ],
    );
  }

  // MARK: - Wide Web Rail
  Widget _creatorNetworkWebRailScaffold({
    required BuildContext context,
    required Widget stack,
  }) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool extended = MediaQuery.sizeOf(context).width >= 1180;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            extended: extended,
            labelType: extended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 16),
              child: Icon(
                Icons.auto_awesome,
                color: scheme.primary,
                size: 28,
              ),
            ),
            destinations: [
              for (final CreatorNetworkAdaptiveDestination destination
                  in destinations)
                NavigationRailDestination(
                  icon: Icon(destination.materialIcon),
                  selectedIcon: Icon(destination.materialSelectedIcon),
                  label: Text(destination.label),
                ),
            ],
          ),
          VerticalDivider(
            width: 1,
            color: scheme.outlineVariant.withValues(alpha: 0.5),
          ),
          Expanded(
            child: ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: stack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Suggestions For Features and Additions Later:
// - Persist last tab in SharedPreferences
// - Keyboard shortcuts 1-5 for web power users
