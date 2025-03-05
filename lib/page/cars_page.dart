import 'package:flutter/cupertino.dart';
import 'package:rentcar/data/car_http_service.dart';
import 'package:rentcar/model/car_model.dart';

class CarProvider extends ChangeNotifier {
  List<CarsModel> carsModel = [];
  CarHttpService carHttpService = CarHttpService();

  void getCarsData() async {
    carsModel = await carHttpService.getCars();
    notifyListeners();
  }
}

class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  @override
  void initState() {
    Provider.of<CarProvider>(context, listen: false).getCarsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F8FC),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomTabBar(),
                      const SizedBox(
                        width: 0,
                      ),
                      const CustomSearch(),
                      const SizedBox(
                        width: 0,
                        height: 10,
                      ),
                      ListBrand(
                        brand: dataLogo,
                      ),
                      const SizedBox(
                        width: 0,
                        height: 10,
                      ),
                      Consumer<CarProvider>(
                        builder: (context, value, child) {
                          if (value.carsModel.isNotEmpty) {
                            return ListCars(
                              cars: context.watch<CarProvider>().carsModel,
                            );
                          }

                          return const Center(
                            child: Text(messageErrorCarsApi),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(bottom: 0, left: 0, child: BottomActionBar())
            ],
          ),
        ),
      ),
    );
  }
}
