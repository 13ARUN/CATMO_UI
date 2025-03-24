import 'package:catmo_ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 2,
      backgroundColor: Color.fromARGB(255, 85, 7, 3),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 255, 247, 243),
                radius: 26,
                child: Icon(Icons.person, size: 40),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(Icons.check_circle, size: 20, color: Colors.green),
                // child: Icon(Icons.error, size: 20, color: Colors.orange),
              ),
            ],
          ),
          // Title
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 255, 247, 243),
            ),
          ),
          // Profile Icon with 3-dot menu
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                ),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 95, 95, 95),
              radius: 26,
              child: Icon(
                Icons.person_3_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
