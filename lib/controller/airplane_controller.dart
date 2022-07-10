import 'package:airplane/ADT/hash_table.dart';
import 'package:airplane/models.dart';

class AirplaneController {
  static HashTable<String, Airplane> airplanes = HashTable();

  //static Map<String, Airplane> airplanes = {
  //  "425A": Airplane(name: "425A", model: "Airbus 727", capacity: 100),
  //};

  static bool addAirplane(String name, String model, int capacity) {
    if (airplanes.containsKey(name)) {
      return false;
    }
    Airplane airplane = Airplane(name: name, model: model, capacity: capacity);
    //airplanes[name] = airplane;
    airplanes.addUnique(name, airplane);
    return true;
  }

  static List getAirplanes() => airplanes.getValues().toList();
}
