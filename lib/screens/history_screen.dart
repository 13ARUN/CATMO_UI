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
    {'date': '21 Mar, 2025', 'event': 'Alarm 1'},
    {'date': '21 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '21 Mar, 2025', 'event': 'Alarm 11'},
    {'date': '20 Mar, 2025', 'event': 'Milky Way 3'},
    {'date': '20 Mar, 2025', 'event': 'dev test'},
    {'date': '20 Mar, 2025', 'event': 'E2_Test_Mustering'},
    {'date': '20 Mar, 2025', 'event': 'Test'},
  ];

  String searchQuery = '';
  DateTime? selectedDate;
  final TextEditingController _searchController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    if (selectedDate != null) {
      setState(() {
        selectedDate = null;
      });
      return;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        historyItems.where((item) {
          bool matchesSearch = item['event']!.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
          bool matchesDate =
              selectedDate == null ||
              item['date'] ==
                  "${selectedDate!.day} ${_getMonthName(selectedDate!.month)}, ${selectedDate!.year}";
          return matchesSearch && matchesDate;
        }).toList();

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
                      side: const BorderSide(color: Color(0xFF550703)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    onPressed: () => _selectDate(context),
                    icon: Icon(
                      selectedDate == null ? Icons.calendar_month : Icons.clear,
                      size: 22,
                    ),
                    label: Text(
                      selectedDate == null
                          ? 'Select Date'
                          : '${selectedDate!.day} ${_getMonthName(selectedDate!.month)}, ${selectedDate!.year}',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 5,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF550703),
                      ),
                      suffixIcon:
                          searchQuery.isNotEmpty
                              ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Color(0xFF550703),
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    searchQuery = '';
                                  });
                                },
                              )
                              : null,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Color(0xFF550703)),
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
                    flex: 9,
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
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        item['date']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: Text(
                                        item['event']!,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF550703),
                                        ),
                                      ),
                                    ),
                                    const Icon(Icons.more_horiz),
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

  String _getMonthName(int month) {
    const monthNames = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return monthNames[month - 1];
  }
}
