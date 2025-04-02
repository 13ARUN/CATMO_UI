import 'package:catmo_ui/app/permission_helper.dart';
import 'package:catmo_ui/app/permissions.dart';
import 'package:catmo_ui/providers/bottomnav_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.scaffoldKey,
    required this.userPermissions,
    required this.ref,
    required this.isSepScreen,
  });

  final int currentIndex;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Set<Permission> userPermissions;
  final WidgetRef ref;
  final bool isSepScreen;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 85, 7, 3),
      currentIndex: currentIndex + 1,
      useLegacyColorScheme: false,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      iconSize: 36,
      selectedItemColor:
          isSepScreen
              ? const Color.fromARGB(255, 186, 131, 118)
              : Color.fromARGB(255, 255, 247, 243),
      unselectedItemColor: const Color.fromARGB(255, 186, 131, 118),
      onTap: (index) {
        if (index == 0) {
          scaffoldKey.currentState?.openDrawer();
        } else {
          isSepScreen
              ? {
                Navigator.pop(context),
                ref.read(bottomNavIndexProvider.notifier).state = index - 1,
              }
              : ref.read(bottomNavIndexProvider.notifier).state = index - 1;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.home_rounded),
              Positioned(
                top: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 8,
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          label: 'Home',
        ),
        if (PermissionHelper.hasPermission(
          userPermissions,
          Permission.triggerAlarms,
        ))
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_rounded),
            label: 'Alarms',
          ),

        if (PermissionHelper.hasPermission(
          userPermissions,
          Permission.viewPastAlerts,
        ))
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'History',
          ),
        if (PermissionHelper.hasPermission(
          userPermissions,
          Permission.viewEvents,
        ))
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_rounded),
            label: 'Events',
          ),
      ],
    );
  }
}
