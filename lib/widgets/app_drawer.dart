import 'package:catmo_ui/app/permission_helper.dart';
import 'package:catmo_ui/app/permissions.dart';
import 'package:catmo_ui/providers/bottomnav_index_provider.dart';
import 'package:catmo_ui/providers/permissions_provider.dart';
import 'package:catmo_ui/screens/docs_img_screen.dart';
import 'package:catmo_ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPermissions = ref.watch(userPermissionsProvider);
    return Drawer(
      backgroundColor: Colors.white,
      width: 340,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 58,
              bottom: 28,
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 85, 7, 3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 28, color: Colors.black),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    Text(
                      'Arun User Student1 Test',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                if (PermissionHelper.hasAnyPermission(userPermissions, [
                  Permission.triggerAlarms,
                  Permission.viewDocsImages,
                  Permission.viewPastAlerts,
                ]))
                  const SectionHeader(title: "Actions"),
                if (PermissionHelper.hasPermission(
                  userPermissions,
                  Permission.triggerAlarms,
                ))
                  DrawerTile(
                    icon: Icons.warning_amber_rounded,
                    title: "Alarms",
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(bottomNavIndexProvider.notifier).state = 1;
                    },
                  ),
                if (PermissionHelper.hasPermission(
                  userPermissions,
                  Permission.viewDocsImages,
                ))
                  DrawerTile(
                    icon: Icons.insert_drive_file_rounded,
                    title: "Documents & Images",
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DocsImgScreen(),
                          ),
                        ),
                  ),
                if (PermissionHelper.hasPermission(
                  userPermissions,
                  Permission.viewPastAlerts,
                ))
                  DrawerTile(
                    icon: Icons.history_rounded,
                    title: "History",
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(bottomNavIndexProvider.notifier).state = 2;
                    },
                  ),
                if (PermissionHelper.hasAnyPermission(userPermissions, [
                  Permission.triggerAlarms,
                  Permission.viewDocsImages,
                  Permission.viewPastAlerts,
                ]))
                  const SizedBox(height: 20),

                if (PermissionHelper.hasPermission(
                  userPermissions,
                  Permission.viewEvents,
                ))
                  const SectionHeader(title: "Events"),
                if (userPermissions.contains(Permission.viewEvents))
                  DrawerTile(
                    icon: Icons.event_note_rounded,
                    title: "Event Details",
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(bottomNavIndexProvider.notifier).state = 3;
                    },
                  ),
                if (PermissionHelper.hasAllPermissions(userPermissions, [
                  Permission.viewEvents,
                  Permission.registerForEvents,
                ]))
                  DrawerTile(
                    icon: Icons.qr_code_scanner_rounded,
                    title: "Scan QR code",
                    onTap: () {
                      Navigator.pop(context);
                      ref.read(bottomNavIndexProvider.notifier).state = 1;
                    },
                  ),
                if (PermissionHelper.hasPermission(
                  userPermissions,
                  Permission.viewEvents,
                ))
                  const SizedBox(height: 20),

                const SectionHeader(title: "Account"),
                DrawerTile(
                  icon: Icons.person_rounded,
                  title: "Profile",
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      ),
                ),
                DrawerTile(
                  icon: Icons.logout_rounded,
                  title: "Logout",
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: Text(
              'v25.03.0 (100)',
              style: TextStyle(
                color: Color.fromARGB(255, 107, 107, 107),
                fontSize: 12,
              ),
            ),
          ),

          // Banner
          // Container(
          //   width: double.infinity,
          //   height: 100,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //     borderRadius: const BorderRadius.only(
          //       topLeft: Radius.circular(16),
          //       topRight: Radius.circular(16),
          //     ),
          //   ),
          //   padding: const EdgeInsets.all(12),
          //   child: const Center(
          //     child: Text(
          //       "Banner",
          //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 85, 7, 3),
            ),
          ),
          const Divider(thickness: 1, color: Color.fromARGB(167, 0, 0, 0)),
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(bottom: 2),
      splashColor: Colors.white,
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}
