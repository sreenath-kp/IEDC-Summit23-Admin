import 'dart:convert';

class Workshop {
  final String title;
  final String description;
  final String posterUrl;
  final String speaker;
  final String time;
  final String venue;
  Workshop({
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.speaker,
    required this.time,
    required this.venue,
  });

  Workshop copyWith({
    String? title,
    String? description,
    String? posterUrl,
    String? speaker,
    String? time,
    String? venue,
  }) {
    return Workshop(
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      speaker: speaker ?? this.speaker,
      time: time ?? this.time,
      venue: venue ?? this.venue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'speaker': speaker,
      'time': time,
      'venue': venue,
    };
  }

  factory Workshop.fromMap(Map<String, dynamic> map) {
    return Workshop(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      posterUrl: map['posterUrl'] ?? '',
      speaker: map['speaker'] ?? '',
      time: map['time'] ?? '',
      venue: map['venue'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Workshop.fromJson(String source) =>
      Workshop.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Workshop(title: $title, description: $description, posterUrl: $posterUrl, speaker: $speaker, time: $time, venue: $venue)';
  }
}
