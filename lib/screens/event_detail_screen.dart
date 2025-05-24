import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/event_model.dart';
import 'dart:io';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final qrData = '${event.name}|${event.place}|${event.time}|${event.date}|${event.description}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Evento'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(event.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Lugar: ${event.place}'),
            Text('Hora: ${event.time}'),
            Text('Fecha: ${event.date}'),
            const SizedBox(height: 10),
            Text(event.description),
            const SizedBox(height: 20),
            if (event.imagePath != null)
              Image.file(File(event.imagePath!), height: 200),
            const SizedBox(height: 20),
            const Text('Código QR del evento:'),
            Center(
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
