import 'package:airplane/models.dart';

class AirplaneController {
  static Map<String, Airplane> airplanes = {
    "test1": Airplane(name: "test1", model: "test1", capacity: 5),
  };

  static bool addAirplane(String name, String model, int capacity) {
    if (airplanes.containsKey(name)) {
      return false;
    }
    Airplane airplane = Airplane(name: name, model: model, capacity: capacity);
    airplanes[name] = airplane;
    return true;
  }

  static int getNumAirplane() {
    return airplanes.length;
  }

  static List getAirplanes() {
    return airplanes.values.toList();
  }

  static Airplane getAirplane(int index) {
    return airplanes.values.toList()[index];
  }
}
