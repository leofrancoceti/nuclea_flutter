import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../models/event_model.dart';

class CreateEventScreen extends StatefulWidget {
  final Event? event;
  final Function(Event) onSave;

  const CreateEventScreen({super.key, this.event, required this.onSave});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name, place, time, date, description;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    name = widget.event?.name ?? '';
    place = widget.event?.place ?? '';
    time = widget.event?.time ?? '';
    date = widget.event?.date ?? '';
    description = widget.event?.description ?? '';
    imagePath = widget.event?.imagePath;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(Event(
        name: name,
        place: place,
        time: time,
        date: date,
        description: description,
        imagePath: imagePath,
      ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event == null ? 'Crear Evento' : 'Editar Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: name,
                decoration: const InputDecoration(labelText: 'Nombre del evento'),
                onChanged: (value) => name = value,
                validator: (value) => value!.isEmpty ? 'Campo obligatorio' : null,
              ),
              TextFormField(
                initialValue: place,
                decoration: const InputDecoration(labelText: 'Lugar'),
                onChanged: (value) => place = value,
              ),
              TextFormField(
                initialValue: time,
                decoration: const InputDecoration(labelText: 'Hora'),
                onChanged: (value) => time = value,
              ),
              TextFormField(
                initialValue: date,
                decoration: const InputDecoration(labelText: 'Fecha'),
                onChanged: (value) => date = value,
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Descripción'),
                onChanged: (value) => description = value,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image),
                label: const Text('Seleccionar Imagen'),
              ),
              if (imagePath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.file(File(imagePath!), height: 150),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
