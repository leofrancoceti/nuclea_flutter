class Event {
  String name;
  String place;
  String time;
  String date;
  String description;
  String? imagePath;

  Event({
    required this.name,
    required this.place,
    required this.time,
    required this.date,
    required this.description,
    this.imagePath,
  });
}
