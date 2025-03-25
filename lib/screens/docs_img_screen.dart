import 'package:catmo_ui/providers/permissions_provider.dart';
import 'package:catmo_ui/widgets/app_drawer.dart';
import 'package:catmo_ui/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocsImgScreen extends ConsumerWidget {
  const DocsImgScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final userPermissions = ref.watch(userPermissionsProvider);
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
