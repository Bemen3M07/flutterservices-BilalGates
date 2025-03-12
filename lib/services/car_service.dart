import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/car_model.dart';

class CarService {
  static const String apiUrl = "https://car-data.p.rapidapi.com/cars";
  static const String apiKey =
      "52367a615cmshb6741fadf598349p197353jsn1d8ec3c40405";

  // Funció per obtenir la llista de cotxes de l'API
  Future<List<Car>> getCars() async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'car-data.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      return Car.carModelFromJson(response.body);
    } else {
      throw Exception('Error carregant les dades');
    }
  }
}
