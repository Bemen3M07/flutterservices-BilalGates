import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Carrega la llista de cotxes quan s'inicialitza la pantalla
    Provider.of<CarProvider>(context, listen: false).loadCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Títol de la barra d'aplicació
        title: const Text('Llista de Cotxes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions), // Icona de broma
            onPressed: () {
              // Navegar a la pantalla d'acudits
              Navigator.pushNamed(context, '/joke');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar cotxe',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (query) {
                // Filtra la llista de cotxes segons la consulta de cerca
                Provider.of<CarProvider>(context, listen: false)
                    .filterCars(query);
              },
            ),
          ),
          Expanded(
            child: Consumer<CarProvider>(
              builder: (context, carProvider, child) {
                if (carProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (carProvider.error.isNotEmpty) {
                  return Center(child: Text('Error: ${carProvider.error}'));
                }

                if (carProvider.cars.isEmpty) {
                  return const Center(
                      child: Text('No hi ha cotxes disponibles.'));
                }

                return ListView.builder(
                  itemCount: carProvider.cars.length,
                  itemBuilder: (context, index) {
                    final car = carProvider.cars[index];
                    return ListTile(
                      title: Text('${car.make} ${car.model}'),
                      subtitle: Text('Any: ${car.year} - Tipus: ${car.type}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
