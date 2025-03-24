import 'package:catmo_ui/models/event_model.dart';
import 'package:catmo_ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

final List<Event> currentEvents = [
  Event('OCT', '17', 'AA Event', '08:00 PM', '05:56 PM', 'AA location'),
  Event('MAR', '13', '1', '10:30 PM', '11:30 PM', 'Location 2'),
  Event('MAR', '18', 'A-QR-Test2', '10:30 PM', '12:00 AM', 'Chennai'),
  Event('MAR', '25', '12', '10:00 PM', '12:00 AM', '222'),
];

final List<Event> previousEvents = [
  Event('MAR', '02', 'A-QR-Test', '11:00 PM', '', ''),
  Event('MAR', '05', 'Lambda', '11:00 PM', '12:00 AM', 'Chennai'),
];

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Events"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Current Events'),
            const SizedBox(height: 12),
            ..._buildEventCards(currentEvents),
            const SizedBox(height: 24),
            _buildSectionTitle('Previous Events'),
            const SizedBox(height: 12),
            ..._buildEventCards(previousEvents, isPrevious: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  List<Widget> _buildEventCards(List<Event> events, {bool isPrevious = false}) {
    return events.map((event) {
      return GestureDetector(
        onTap: () {
          // Future interaction: Navigate or show details
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 80,
                decoration: BoxDecoration(
                  color: isPrevious ? Colors.grey : const Color(0xFF550703),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      event.month,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.day,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 16,
                            color: Color.fromARGB(255, 5, 96, 170),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${event.startTime} - ${event.endTime}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 5, 96, 170),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: const Color.fromARGB(255, 0, 92, 3),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              event.location.isNotEmpty
                                  ? event.location
                                  : 'No location',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 92, 3),
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.more_vert, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
