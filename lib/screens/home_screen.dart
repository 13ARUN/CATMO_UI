import 'package:catmo_ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final timeString = DateFormat('hh:mm:ss a').format(now);

    return Scaffold(
      appBar: CustomAppBar(title: "Dashboard"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFB71C1C),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Active Alerts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: const Text(
                      '2',
                      style: TextStyle(
                        color: Color(0xFFB71C1C),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildAlertCard(
              icon: Icons.fireplace,
              iconColor: Colors.redAccent,
              iconBgColor: const Color(0x1AFF0000),
              title: 'E2_Test_Mustering',
              message:
                  'E2_Test_Mustering button was pressed at Monday March 24 - 08:14 AM',
              timestamp: 'Today at $timeString',
              status: 'Requires Mustering',
              statusColor: Colors.redAccent,
              footerBold: true,
            ),
            const SizedBox(height: 5),
            _buildAlertCard(
              icon: Icons.check_circle,
              iconColor: Colors.green,
              iconBgColor: const Color(0x1A00FF00),
              title: 'E2_Test_Non_Mustering',
              message:
                  'E2_Test_Non_Mustering button was pressed at Thursday March 20 - 08:55 AM',
              subMessage: '03/20/25 at 06:25:54 PM',
              timestamp: 'Alarm cleared',
              status: 'Accepted by Arun ✅',
              statusColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String message,
    String? subMessage,
    required String timestamp,
    required String status,
    required Color statusColor,
    bool footerBold = false,
  }) {
    return Card(
      elevation: 2,
      color: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: iconColor, size: 32),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(message, style: const TextStyle(fontSize: 14)),
                      if (subMessage != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subMessage,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(thickness: 1, color: const Color(0xFFB71C1C)),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timestamp,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight:
                        footerBold ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
