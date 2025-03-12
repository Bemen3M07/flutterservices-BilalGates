import 'dart:convert';
import 'package:rentcar/model/car_model.dart';

List<Car> parseCars(String jsonStr) {
  // Decodifica la cadena JSON a una llista d'elements dinàmics
  final List<dynamic> data = json.decode(jsonStr);
  // Mapeja cada element de la llista al model Car
  return data.map((item) => Car.fromMap(item)).toList();
}
