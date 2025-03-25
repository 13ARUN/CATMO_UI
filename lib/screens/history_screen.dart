import 'package:catmo_ui/screens/event_details_screen.dart';
import 'package:catmo_ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, String>> historyItems = [
    {'date': '21 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '21 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '21 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '20 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '20 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '20 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '20 Mar, 2025', 'event': 'E2_Test_Mustering'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        historyItems
            .where(
              (item) => item['event']!.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
            )
            .toList();

    return Scaffold(
      appBar: CustomAppBar(title: "History"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF550703),
                      elevation: 1,
                      side: BorderSide(color: const Color(0xFF550703)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      // Handle date selection
                    },
                    icon: const Icon(Icons.calendar_month, size: 22),
                    label: const Text('Select Date'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 5,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Column Titles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      'Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      'Event Type',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                ],
              ),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 4),
            Expanded(
              child:
                  filteredItems.isEmpty
                      ? const Center(child: Text('No events found.'))
                      : ListView.separated(
                        itemCount: filteredItems.length,
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 236, 236, 236),
                            ),

                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetailsScreen(),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 12,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      item['date']!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item['event']!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF550703),
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.more_horiz),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
