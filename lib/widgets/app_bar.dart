import 'package:catmo_ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isConnectedProvider = StateProvider<bool>((ref) => true);

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConnected = ref.watch(isConnectedProvider);

    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      elevation: 2,
      backgroundColor: Color.fromARGB(255, 85, 7, 3),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              ref.read(isConnectedProvider.notifier).state = true;
              _showSnackbar(
                context,
                "Connection process started",
                const Color.fromARGB(255, 48, 147, 51),
              );
            },
            onLongPress: () {
              ref.read(isConnectedProvider.notifier).state = false;
              _showSnackbar(
                context,
                "Disconnected from MQTT",
                const Color.fromARGB(255, 222, 133, 0),
              );
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor:
                      isConnected
                          ? Color.fromARGB(255, 0, 171, 6)
                          : Color.fromARGB(255, 255, 153, 0),
                  child: CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage("assets/logo/app_logo.png"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 8,
                    child:
                        isConnected
                            ? Icon(
                              Icons.check_circle_rounded,
                              size: 14,
                              color: const Color.fromARGB(255, 0, 171, 6),
                            )
                            : Icon(
                              Icons.error,
                              size: 14,
                              color: const Color.fromARGB(255, 255, 153, 0),
                            ),
                  ),
                ),
              ],
            ),
          ),
          // Title
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 255, 247, 243),
            ),
          ),
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                ),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo/mywall.jpg"),
              radius: 25,
            ),
          ),
        ],
      ),
    );
  }
}
