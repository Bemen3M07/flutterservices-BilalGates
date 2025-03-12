import 'dart:convert';

class Joke {
  final int id;
  final String joke;
  final String status;

  Joke({
    required this.id,
    required this.joke,
    required this.status,
  });

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      id: map['id'] ?? 0,
      joke: map['joke'] ?? '',
      status: map['status'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'joke': joke,
      'status': status,
    };
  }

  factory Joke.fromJson(String source) => Joke.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
}
