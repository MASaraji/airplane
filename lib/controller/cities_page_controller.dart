import 'package:airplane/controller/cities_controller.dart';
import 'package:get/get.dart';

class CitiesPageController extends GetxController {
  bool showSearchBox = false;
  List cities = CitiesController.getCities();
  void changeSearchBoxMode() {
    showSearchBox = !showSearchBox;
    update();
  }

  void getCities([String pattern = ""]) {
    if (pattern == "") {
      cities = CitiesController.getCities();
    } else {
      cities = CitiesController.getCities(pattern);
    }
    update();
  }
}
