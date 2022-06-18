import '../models.dart';

class CitiesController {
  static var cities = {
    "Tehran": City(name: "Tehran"),
    "Mashhad": City(name: "Mashhad")
  };

  static bool addCity(String cityName) {
    if (cities.containsKey(cityName)) {
      return false;
    }
    City city = City(name: cityName);
    cities[cityName] = city;
    return true;
  }

  static City getCity(int index) {
    return cities.values.toList()[index];
  }

  static int getNumCity() {
    return cities.length;
  }

  static List<City> getCitiesPattern(String pattern) {
    List<City> result = [];
    for (var city in cities.values) {
      if (city.name.contains(pattern)) {
        result.add(city);
      }
    }
    return result;
  }

  static List<City> getCities([String pattern = ""]) {
    if (pattern == "") {
      return cities.values.toList();
    }
    return getCitiesPattern(pattern);
  }
}
