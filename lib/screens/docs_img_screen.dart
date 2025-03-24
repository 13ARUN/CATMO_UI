import 'package:catmo_ui/providers/bottomnav_index_provider.dart';
import 'package:catmo_ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocsImgScreen extends ConsumerWidget {
  const DocsImgScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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

        title: const Text(
          "Document & Images",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Center(child: Text("Document & Images")),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: themeColor,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        iconSize: 36,
        selectedItemColor: Color.fromARGB(255, 186, 131, 118),
        unselectedItemColor: const Color.fromARGB(255, 186, 131, 118),
        onTap: (index) {
          if (index == 0) {
            scaffoldKey.currentState?.openDrawer();
          } else {
            Navigator.pop(context);
            ref.read(bottomNavIndexProvider.notifier).state = index - 1;
          }
        },
        items: const [
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
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_rounded),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning_amber_rounded),
            label: 'Alarms',
          ),
        ],
      ),
    );
  }
}
