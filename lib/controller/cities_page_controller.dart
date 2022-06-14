import 'package:airplane/controller/cities_controller.dart';
import 'package:get/get.dart';

class CitiesPageController extends GetxController {
  var showSearchBox = false.obs;
  var cities = CitiesController.getCities().obs;

  void changeSearchBoxMode() {
    showSearchBox.value = !showSearchBox.value;
  }

  void getCities([String pattern = ""]) {
    if (pattern == "") {
      cities.value = CitiesController.getCities();
    } else {
      cities.value = CitiesController.getCities(pattern);
    }
  }
}
