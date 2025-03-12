import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/joke_provider.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jokeProvider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acudit Aleatori'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              jokeProvider.isLoading
                  ? const CircularProgressIndicator()
                  : jokeProvider.error.isNotEmpty
                      ? Text('Error: ${jokeProvider.error}')
                      : Text(
                          jokeProvider.joke,
                          style: const TextStyle(fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
              const SizedBox(height: 20),
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
