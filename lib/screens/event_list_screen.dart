import 'package:flutter/material.dart';
import '../models/event_model.dart';
import 'create_event_screen.dart';
import 'event_detail_screen.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Event> events = [];

  void _addEvent(Event event) {
    setState(() {
      events.add(event);
    });
  }

  void _editEvent(Event event, int index) {
    setState(() {
      events[index] = event;
    });
  }

  void _deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return Card(
            child: ListTile(
              title: Text(event.name),
              subtitle: Text('${event.date} - ${event.time}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailScreen(event: event),
                  ),
                );
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateEventScreen(
                            event: event,
                            onSave: (editedEvent) => _editEvent(editedEvent, index),
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteEvent(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateEventScreen(
                onSave: _addEvent,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
