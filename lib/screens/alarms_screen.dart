import 'package:catmo_ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AlarmsScreen extends StatefulWidget {
  const AlarmsScreen({super.key});

  @override
  State<AlarmsScreen> createState() => _AlarmsScreenState();
}

class _AlarmsScreenState extends State<AlarmsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Alarms"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            AlarmTile(
              alarmName: "Fire Alert",
              alarmColor: Colors.pink,
              alarmIcon: Icons.fireplace,
            ),
            AlarmTile(
              alarmName: "E2 Test Mustering",
              alarmColor: Colors.blue,
              alarmIcon: Icons.lock,
            ),
            AlarmTile(
              alarmName: "Intruder Alarm",
              alarmColor: Colors.orange,
              alarmIcon: Icons.lock_person,
            ),
            AlarmTile(
              alarmName: "Lockdown",
              alarmColor: Colors.deepPurple,
              alarmIcon: Icons.lock,
            ),
            AlarmTile(
              alarmName: "Tsunami Alert",
              alarmColor: Colors.green,
              alarmIcon: Icons.waves_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmTile extends StatelessWidget {
  const AlarmTile({
    super.key,
    required this.alarmName,
    required this.alarmColor,
    required this.alarmIcon,
  });

  final String alarmName;
  final Color alarmColor;
  final IconData alarmIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        color: alarmColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(65, 255, 255, 255),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(alarmIcon, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    alarmName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
