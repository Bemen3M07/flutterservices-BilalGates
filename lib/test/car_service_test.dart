import 'package:flutter_test/flutter_test.dart';
import 'package:rentcar/services/car_service.dart';
import 'package:rentcar/model/car_model.dart';

void main() {
  test('Test de connexió a l’API i obtenció de dades', () async {
    final service = CarService();
    final cars = await service.getCars();
    expect(cars, isA<List<Car>>());
    expect(cars.isNotEmpty, true);
  });
}
