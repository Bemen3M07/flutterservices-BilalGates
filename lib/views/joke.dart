import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/joke_provider.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obté el proveïdor de chistes del context
    final jokeProvider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // Títol de la barra d'aplicació
        title: const Text('Acudit Aleatori'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mostra un indicador de càrrega si s'està carregant un acudit
              jokeProvider.isLoading
                  ? const CircularProgressIndicator()
                  // Mostra un missatge d'error si hi ha un error
                  : jokeProvider.error.isNotEmpty
                      ? Text('Error: ${jokeProvider.error}')
                      // Mostra l'acudit si no hi ha errors
                      : Text(
                          jokeProvider.joke,
                          style: const TextStyle(fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
              const SizedBox(height: 20),
              // Botó per obtenir un altre acudit
              ElevatedButton(
                onPressed: () {
                  jokeProvider.fetchJoke();
                },
                child: const Text('Mostrar un altre acudit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
