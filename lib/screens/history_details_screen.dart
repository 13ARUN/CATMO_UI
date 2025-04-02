import 'package:catmo_ui/app/permission_helper.dart';
import 'package:catmo_ui/app/permissions.dart';
import 'package:catmo_ui/providers/permissions_provider.dart';
import 'package:catmo_ui/widgets/app_drawer.dart';
import 'package:catmo_ui/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryDetailsScreen extends ConsumerWidget {
  const HistoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final userPermissions = ref.watch(userPermissionsProvider);
    const Color themeColor = Color(0xFF550703);
    const Color lightColor = Color(0xFFFFF7F3);
    const Color secondaryColor = Color(0xFFBA8376);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: themeColor,
        foregroundColor: lightColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [themeColor, secondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Card(
            color: lightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 8,
            shadowColor: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Event Type',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'E2_Test_Mustering',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: themeColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text("E2_Test_Mustering button was pressed at"),
                  Text(
                    "Friday March 21 - 01:33 AM",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),

                  const SizedBox(height: 12),
                  _buildInfoCard(),

                  const SizedBox(height: 12),
                  const Divider(thickness: 1, color: Colors.black12),
                  const SizedBox(height: 12),

                  const Text(
                    'Checked In Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  const Icon(
                    Icons.verified_user,
                    size: 60,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 12),

                  _buildStatusRow('Checked In', '0', Colors.green),
                  _buildStatusRow('Not Checked In', '56', Colors.red),
                  _buildStatusRow('Absent', '0', Colors.black87),

                  const SizedBox(height: 16),

                  if (PermissionHelper.hasPermission(
                    userPermissions,
                    Permission.downloadReportsOfPastAlerts,
                  ))
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download),
                        label: const Text('Detailed Report'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: themeColor,
                          foregroundColor: lightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 4,
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

  Widget _buildInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Color.fromARGB(255, 255, 238, 237),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Alarm triggered by :', 'Arun User Teacher1 Test'),
            const SizedBox(height: 4),
            _buildInfoRow(
              'Triggered at :',
              '21 Mar, 2025 - 11:03:57 AM',
              bold: true,
            ),
            const Divider(color: Colors.black54, height: 24),
            _buildInfoRow('Alarm cleared by :', 'Arun User Teacher1 Test'),
            const SizedBox(height: 4),
            _buildInfoRow(
              'Cleared at :',
              '21 Mar, 2025 - 11:05:13 AM',
              bold: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String count, Color countColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(width: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: countColor,
            ),
          ),
        ],
      ),
    );
  }
}
