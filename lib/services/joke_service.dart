import 'package:http/http.dart' as http;
import 'package:rentcar/model/joke_model.dart';

class JokeService {
  final String baseUrl = 'https://api.sampleapis.com/jokes/goodJokes';

  // Funció per obtenir un acudit aleatori de l'API
  Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      // Suposem que l'API retorna una llista d'acudits; triem un aleatori.
      final List<dynamic> jokesList = response.body.isNotEmpty
          ? List<dynamic>.from(response.body as List)
          : [];
      if (jokesList.isNotEmpty) {
        // Trieu un acudit aleatori
        final randomIndex = (jokesList.length *
                (new DateTime.now().millisecondsSinceEpoch % 1000) /
                1000)
            .floor();
        return Joke.fromMap(jokesList[randomIndex]);
      } else {
        throw Exception('No s\'han trobat acudits');
      }
    } else {
      throw Exception('Error al carregar l\'acudit :(');
    }
  }
}
