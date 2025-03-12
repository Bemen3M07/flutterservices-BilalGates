import 'dart:convert';
import 'package:rentcar/model/car_model.dart';

List<Car> parseCars(String jsonStr) {
  final List<dynamic> data = json.decode(jsonStr);
  return data.map((item) => Car.fromMap(item)).toList();
}
