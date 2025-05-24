import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EventCard({
    super.key,
    required this.event,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(event.name),
        subtitle: Text('${event.date} - ${event.place}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
            IconButton(onPressed: onDelete, icon: const Icon(Icons.delete, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
