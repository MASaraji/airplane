import 'package:airplane/controller/cities_controller.dart';
import 'package:get/get.dart';

class CitiesPageController extends GetxController {
  var showSearchBox = false.obs;
  var sort = 1.obs;
  var cities = CitiesController.cities.values.toList().obs
    ..sort(
      (a, b) => a.name.compareTo(b.name),
    );

  void changeSearchBoxMode() {
    showSearchBox.value = !showSearchBox.value;
  }

  void getCities([String pattern = ""]) {
    if (pattern == "") {
      sort.value = 1;
      cities.value = CitiesController.getCities()
        ..sort(
          (a, b) => a.name.compareTo(b.name),
        );
    } else {
      cities.value = CitiesController.getCities(pattern);
    }
  }

  void changeSort(int value) {
    if (sort.value == value) {
      return;
    }
    sort.value = value;
    cities.value = cities.reversed.toList();
  }
}
