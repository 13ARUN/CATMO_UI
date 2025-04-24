import 'package:catmo_ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AlarmsScreen extends StatefulWidget {
  const AlarmsScreen({super.key});

  @override
  State<AlarmsScreen> createState() => _AlarmsScreenState();
}

class _AlarmsScreenState extends State<AlarmsScreen> {
  final List<Map<String, dynamic>> activeAlarms = [
    {'name': "Fire Alert", 'icon': Icons.fireplace},
    {'name': "Intruder Alarm", 'icon': Icons.lock_person},
  ];

  final List<Map<String, dynamic>> nonActiveAlarms = [
    {'name': "E2 Test Mustering", 'color': Colors.blue, 'icon': Icons.lock},
    {'name': "Lockdown", 'color': Colors.deepPurple, 'icon': Icons.lock},
    {
      'name': "Tsunami Alert",
      'color': Colors.green,
      'icon': Icons.waves_outlined,
    },
    {'name': "Medical Emergency", 'color': Colors.red, 'icon': Icons.emergency},
    {'name': "Rain", 'color': Colors.teal, 'icon': Icons.water_drop},
    {'name': "Solar Wave", 'color': Colors.orange, 'icon': Icons.sunny},
    {
      'name': "Power Shut Down",
      'color': Colors.deepOrange,
      'icon': Icons.power,
    },
    {'name': "Earthquake", 'color': Colors.amber, 'icon': Icons.landslide},
  ];

  void clearAlarm(int index) {
    setState(() {
      activeAlarms.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Alarms"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            if (activeAlarms.isNotEmpty) ...[
              const Text(
                "Active Alarms",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...activeAlarms.asMap().entries.map((entry) {
                int index = entry.key;
                var alarm = entry.value;
                return AlarmTile(
                  alarmName: alarm['name'],
                  alarmColor: Colors.grey,
                  alarmIcon: alarm['icon'],
                  onClear: () => clearAlarm(index),
                );
              }),
              const SizedBox(height: 16),
            ],
            const Text(
              "Alarms",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...nonActiveAlarms.map(
              (alarm) => AlarmTile(
                alarmName: alarm['name'],
                alarmColor: alarm['color'],
                alarmIcon: alarm['icon'],
              ),
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
    this.onClear,
  });

  final String alarmName;
  final Color alarmColor;
  final IconData alarmIcon;
  final VoidCallback? onClear;

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
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
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
                if (onClear != null)
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white),
                    onPressed: onClear,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
