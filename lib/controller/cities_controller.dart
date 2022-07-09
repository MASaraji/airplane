import 'package:airplane/ADT/hash_table.dart';

import '../models.dart';

class CitiesController {
  static HashTable<String, City> cities = HashTable();
  //static var cities = {
  //  "Tehran": City(name: "Tehran"),
  //  "Mashhad": City(name: "Mashhad")
  //};

  static bool addCity(String cityName) {
    if (cities.containsKey(cityName)) {
      return false;
    }
    City city = City(name: cityName);
    cities.addUnique(cityName, city);
    //cities[cityName] = city;
    return true;
  }

  // static City getCity(int index) => cities.values.toList()[index];

  static int getNumCity() => cities.length();

  static List<City> getCitiesPattern(String pattern) {
    List<City> result = [];
    for (var city in cities.getValues().toList()) {
      if (city!.name.contains(pattern)) {
        result.add(city);
      }
    }
    return result;
  }

  static List<City?> getCities([String pattern = ""]) {
    if (pattern == "") {
      return cities.getValues().toList();
    }
    return getCitiesPattern(pattern);
  }
}
