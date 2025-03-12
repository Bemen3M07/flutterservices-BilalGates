import 'dart:convert';

class Car {
  final int id;
  final int year;
  final String make;
  final String model;
  final String type;

  Car({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  // Convertir JSON a un objecte Car
  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'],
      year: map['year'],
      make: map['make'],
      model: map['model'],
      type: map['type'],
    );
  }

  // Convertir Car a JSON
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'year': year,
      'make': make,
      'model': model,
      'type': type,
    };
  }

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  static List<Car> carModelFromJson(String str) =>
      List<Car>.from(json.decode(str).map((x) => Car.fromMap(x)));

  static String carModelToJson(List<Car> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}
