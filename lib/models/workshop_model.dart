import 'dart:convert';

class Workshop {
  final String title;
  final String description;
  final String posterUrl;
  final String speaker;
  final String startTime;
  final String endTime;
  final String venue;
  final List<String> attendees;
  final List<String> preregistered;
  Workshop({
    required this.title,
    required this.description,
    required this.posterUrl,
    required this.speaker,
    required this.startTime,
    required this.endTime,
    required this.venue,
    required this.attendees,
    required this.preregistered,
  });

  Workshop copyWith({
    String? title,
    String? description,
    String? posterUrl,
    String? speaker,
    String? startTime,
    String? endTime,
    String? venue,
    List<String>? attendees,
    List<String>? preregistered,
  }) {
    return Workshop(
      title: title ?? this.title,
      description: description ?? this.description,
      posterUrl: posterUrl ?? this.posterUrl,
      speaker: speaker ?? this.speaker,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      venue: venue ?? this.venue,
      attendees: attendees ?? this.attendees,
      preregistered: preregistered ?? this.preregistered,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'posterUrl': posterUrl,
      'speaker': speaker,
      'startTime': startTime,
      'endTime': endTime,
      'venue': venue,
      'attendees': attendees,
      'preregistered': preregistered,
    };
  }

  factory Workshop.fromMap(Map<String, dynamic> map) {
    return Workshop(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      posterUrl: map['posterUrl'] ?? '',
      speaker: map['speaker'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      venue: map['venue'] ?? '',
      attendees: List<String>.from(map['attendees']),
      preregistered: List<String>.from(map['preregistered']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Workshop.fromJson(String source) =>
      Workshop.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Workshop(title: $title, description: $description, posterUrl: $posterUrl, speaker: $speaker, startTime: $startTime, endTime: $endTime, venue: $venue, attendees: $attendees, preregistered: $preregistered)';
  }
}

List<Workshop> dummyWorkshops = List.generate(
  10,
  (index) => Workshop(
    title: 'Workshop ${index + 1}',
    description: 'This is the description for Workshop ${index + 1}',
    posterUrl: 'https://example.com/poster${index + 1}.jpg',
    speaker: 'Speaker ${index + 1}',
    startTime: '2022-01-01 10:00:00',
    endTime: '2022-01-01 12:00:00',
    venue: 'Venue ${index + 1}',
    attendees: [
      'Attendee 1',
      'Attendee 2',
      'Attendee 3',
      'Attendee 4',
      'Attendee 5',
    ],
    preregistered: [
      'Preregistered 1',
      'Preregistered 2',
      'Preregistered 3',
      'Preregistered 4',
      'Preregistered 5',
    ],
  ),
);
