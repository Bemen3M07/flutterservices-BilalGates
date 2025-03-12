import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokeProvider extends ChangeNotifier {
  String _joke = "Prem el botó per veure un acudit!";
  bool _isLoading = false;
  String _error = "";

  String get joke => _joke;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchJoke() async {
    _isLoading = true;
    _error = "";
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse('https://api.sampleapis.com/jokes/goodJokes'));

      if (response.statusCode == 200) {
        final List<dynamic> jokes = json.decode(response.body);
        if (jokes.isNotEmpty) {
          _joke = jokes[(jokes.length *
                      (new DateTime.now().millisecondsSinceEpoch % 1000) /
                      1000)
                  .floor()]["setup"] +
              "\n\n" +
              jokes[(jokes.length *
                      (new DateTime.now().millisecondsSinceEpoch % 1000) /
                      1000)
                  .floor()]["punchline"];
        } else {
          _error = "No s'han trobat acudits.";
        }
      } else {
        _error = "Error en carregar els acudits. :(";
      }
    } catch (e) {
      _error = "Error: $e";
    }

    _isLoading = false;
    notifyListeners();
  }
}
