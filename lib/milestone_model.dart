class Milestone {
  String id; // Unique identifier
  String date;
  String type;
  String notes;
  String? image; // Optional image URL

  Milestone({
    required this.id,
    required this.date,
    required this.type,
    required this.notes,
    this.image,
  });

  // Factory method to create a Milestone instance from a JSON object
  factory Milestone.fromJson(Map<String, dynamic> json) {
    return Milestone(
      id: json['id'],
      date: json['date'],
      type: json['type'],
      notes: json['notes'],
      image: json['image'],
    );
  }

  // Method to convert a Milestone instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'type': type,
      'notes': notes,
      'image': image,
    };
  }
}
