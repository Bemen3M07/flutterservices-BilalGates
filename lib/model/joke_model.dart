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

  // Crear un objecte Joke a partir d'un mapa
  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      id: map['id'] ?? 0,
      joke: map['joke'] ?? '',
      status: map['status'] ?? '',
    );
  }

  // Convertir un objecte Joke a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'joke': joke,
      'status': status,
    };
  }

  // Crear un objecte Joke a partir d'un JSON
  factory Joke.fromJson(String source) => Joke.fromMap(json.decode(source));
  // Convertir un objecte Joke a un JSON
  String toJson() => json.encode(toMap());
}
