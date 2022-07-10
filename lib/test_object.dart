import 'controller/airplane_controller.dart';
import 'controller/cities_controller.dart';

class TestObject {
  List airplanes = [
    ["Esmail-01", "Airbus A320", 150],
    ["Esmail-Rakhsh", "Airbus A380", 550],
    ["Sara", "Boeing 727", 130],
    ["Sara2", "Boing 727", 130],
    ["Esmail-Personal", "Boeing 747", 220],
    ["BandarAir-Kosar", "Boeing 777", 368],
    ["BandarAir-Omid", "Boeing 727", 368],
    ["BandarAir-Saber1", "Airbus A320", 150],
    ["BandarAir-Saber2", "Airbus A320", 150],
  ];
  List cities = [
    "Tehran",
    "Esfahan",
    "Shiraz",
    "Lar",
    "Yazd",
    "Mashhad",
    "Kerman",
    "Bandar",
    "Booshehr"
  ];
  TestObject() {
    for (var airplane in airplanes) {
      addAirplane(airplane[0], airplane[1], airplane[2]);
    }
    for (var city in cities) {
      addCity(city);
    }
  }

  addAirplane(String name, String model, int cap) =>
      AirplaneController.addAirplane(name, model, cap);

  addCity(String city) => CitiesController.addCity(city);
}
