import 'package:catmo_ui/app/permission_helper.dart';
import 'package:catmo_ui/app/permissions.dart';
import 'package:catmo_ui/providers/permissions_provider.dart';
import 'package:catmo_ui/widgets/app_drawer.dart';
import 'package:catmo_ui/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final userPermissions = ref.watch(userPermissionsProvider);
    final themeColor = const Color.fromARGB(255, 85, 7, 3);
    final lightColor = const Color.fromARGB(255, 255, 247, 243);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 85, 7, 3),
        foregroundColor: lightColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          if (PermissionHelper.hasPermission(
            userPermissions,
            Permission.editProfile,
          ))
            IconButton(
              icon: const Icon(Icons.edit_note_sharp, size: 36),
              onPressed: () {},
            ),
        ],
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 85, 7, 3),
              Color.fromARGB(255, 186, 131, 118),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: lightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 8,
            shadowColor: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: AssetImage("assets/logo/mywall.jpg"),
                    radius: 50,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Arun User Student1 Test',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'teststudent1@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Divider(height: 30, thickness: 1),

                  // Contact Info
                  Row(
                    children: [
                      Icon(Icons.phone, size: 22, color: themeColor),
                      const SizedBox(width: 8),
                      const Text('9876543210', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 22, color: themeColor),
                      SizedBox(width: 8),
                      Text('Vriksha', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const Divider(height: 30, thickness: 1),

                  // Role Info
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Role:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Arun-Test-Role-Student',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Advisor:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Arun User Teacher1 Test',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.lock_reset, size: 25),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: themeColor,
                        foregroundColor: lightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      label: const Text(
                        'Send Reset Password Link',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 0,
        scaffoldKey: scaffoldKey,
        userPermissions: userPermissions,
        ref: ref,
        isSepScreen: true,
      ),
    );
  }
}
