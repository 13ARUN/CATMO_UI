import 'package:catmo_ui/providers/bottomnav_index_provider.dart';
import 'package:catmo_ui/screens/alarms_screen.dart';
import 'package:catmo_ui/screens/events_screen.dart';
import 'package:catmo_ui/screens/history_screen.dart';
import 'package:catmo_ui/screens/home_screen.dart';
import 'package:catmo_ui/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          EventsScreen(),
          HistoryScreen(),
          AlarmsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 85, 7, 3),
        currentIndex: currentIndex + 1,
        useLegacyColorScheme: false,
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        iconSize: 36,
        selectedItemColor: Color.fromARGB(255, 255, 247, 243),
        unselectedItemColor: const Color.fromARGB(255, 186, 131, 118),
        onTap: (index) {
          if (index == 0) {
            scaffoldKey.currentState?.openDrawer();
          } else {
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
                      "2",
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
