import 'dart:convert';
import 'package:rentcar/model/car_model.dart';

// Funció per analitzar una cadena JSON i convertir-la en una llista d'objectes Car
List<Car> parseCars(String jsonStr) {
  final List<dynamic> data = json.decode(jsonStr);
  return data.map((item) => Car.fromMap(item)).toList();
}
