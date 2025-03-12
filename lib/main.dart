import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/car_provider.dart';
import 'providers/joke_provider.dart';
import 'views/home.dart';
import 'views/joke.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Proveedor para la gestión del estado de los coches
        ChangeNotifierProvider(create: (context) => CarProvider()),
        // Proveedor para la gestión del estado de los chistes
        ChangeNotifierProvider(
            create: (context) => JokeProvider()),
      ],
      // El widget principal de la aplicación
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación
      title: 'Pràctica JSON Car',
      // Desactiva la bandera de depuración
      debugShowCheckedModeBanner: false,
      // Ruta inicial de la aplicación
      initialRoute: '/',
      // Definición de las rutas de la aplicación
      routes: {
        // Ruta para la pantalla principal
        '/': (context) => const HomeScreen(),
        // Ruta para la pantalla de chistes
        '/joke': (context) => const JokeScreen(),
      },
    );
  }
}
