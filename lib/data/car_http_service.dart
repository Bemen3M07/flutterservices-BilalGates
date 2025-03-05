import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rentcar/model/brand_model.dart';
import 'package:rentcar/model/car_model.dart';
import 'package:rentcar/utils/const_app.dart';

class CarHttpService {
  final String _url = "https://car-data.p.rapidapi.com/cars?limit=10&page=0";
  final String _headerKey = "52367a615cmshb6741fadf598349p197353jsn1d8ec3c40405";
  final String _headerHost = "car-data.p.rapidapi.com";

  Future<List<CarsModel>> getCars() async {
    var uri = Uri.parse(_url + endPointCars);
    var response = await http
        .get(uri, headers: {headerKey: _headerKey, headerHost: _headerHost});

    if (response.statusCode == 200) {
      return carsModelFromJson(response.body);
    } else {
      throw (messageErrorCarsApi);
    }
  }

  Future<List<String>> getBrand() async {
    var uri = Uri.parse(_url + endPointBrands);
    var response = await http
        .get(uri, headers: {headerKey: _headerKey, headerHost: _headerHost});

    if (response.statusCode == 200) {
      return brandModelFromJson(response.body);
    } else {
      throw (messageErrorBrandApi);
    }
  }
}
