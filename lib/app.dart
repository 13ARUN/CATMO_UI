import 'package:catmo_ui/app/permissions.dart';
import 'package:catmo_ui/providers/bottomnav_index_provider.dart';
import 'package:catmo_ui/providers/permissions_provider.dart';
import 'package:catmo_ui/screens/alarms_screen.dart';
import 'package:catmo_ui/screens/events_screen.dart';
import 'package:catmo_ui/screens/history_screen.dart';
import 'package:catmo_ui/screens/home_screen.dart';
import 'package:catmo_ui/widgets/app_drawer.dart';
import 'package:catmo_ui/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final userPermissions = ref.watch(userPermissionsProvider);
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(),
          if (userPermissions.contains(Permission.viewEvents)) EventsScreen(),
          HistoryScreen(),
          AlarmsScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: currentIndex,
        scaffoldKey: scaffoldKey,
        userPermissions: userPermissions,
        ref: ref,
        isSepScreen: false,
      ),
    );
  }
}
