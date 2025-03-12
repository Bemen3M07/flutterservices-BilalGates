import 'package:flutter/material.dart';
import 'package:rentcar/model/car_model.dart';
import 'package:rentcar/services/car_service.dart';

class CarProvider with ChangeNotifier {
  // Variables per emmagatzemar la llista de cotxes, la llista filtrada, l'estat de càrrega i els errors
  List<Car> _cars = [];
  List<Car> _filteredCars = [];
  bool _isLoading = false;
  String _error = '';

  // Getters per accedir a les variables privades
  List<Car> get cars => _filteredCars;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Funció per carregar la llista de cotxes
  Future<void> loadCars() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cars = await CarService().getCars();
      _filteredCars = _cars;
      _error = '';
    } catch (e) {
      _error = e.toString();
      _cars = [];
      _filteredCars = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  // Funció per filtrar la llista de cotxes segons la consulta de cerca
  void filterCars(String query) {
    if (query.isEmpty) {
      _filteredCars = _cars;
    } else {
      _filteredCars = _cars
          .where((car) =>
              car.make.toLowerCase().contains(query.toLowerCase()) ||
              car.model.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
