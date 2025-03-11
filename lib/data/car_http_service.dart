import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rentcar/model/brand_model.dart';
import 'package:rentcar/model/car_model.dart';
import 'package:rentcar/utils/const_app.dart';
import 'dart:convert';

const String messageErrorCarsApi = "Error fetching cars data";
const String messageErrorBrandApi = "Error fetching brand data";

// Define the endpoints
const String endPointCars = "/cars?limit=10&page=0";
const String endPointBrands = "/brands";

// Define the function to parse the brand model from JSON
List<String> brandModelFromJson(String str) {
  // Implement the JSON parsing logic here
  // This is just a placeholder implementation
  return List<String>.from(json.decode(str).map((x) => x.toString()));
}

class CarHttpService {
  final String _url = "https://car-data.p.rapidapi.com";
  final String _headerKey =
      "52367a615cmshb6741fadf598349p197353jsn1d8ec3c40405";
  final String _headerHost = "car-data.p.rapidapi.com";

  Future<List<CarsModel>> getCars() async {
    var uri = Uri.parse(_url + endPointCars);
    var response = await http
        .get(uri, headers: {_headerKey: _headerKey, _headerHost: _headerHost});

    if (response.statusCode == 200) {
      return carsModelFromJson(response.body);
    } else {
      throw (messageErrorCarsApi);
    }
  }

  Future<List<String>> getBrand() async {
    var uri = Uri.parse(_url + endPointBrands);
    var response = await http
        .get(uri, headers: {_headerKey: _headerKey, _headerHost: _headerHost});

    if (response.statusCode == 200) {
      return brandModelFromJson(response.body);
    } else {
      throw (messageErrorBrandApi);
    }
  }
}
