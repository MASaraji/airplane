import 'package:airplane/controller/airplane_controller.dart';
import 'package:get/get.dart';

class AirplanesPageController extends GetxController {
  var airplanes = AirplaneController.getAirplanes().obs
    ..sort(
      (a, b) => a.name.compareTo(b.name),
    );

  var sort = 1.obs;

  void getAirplanes() {
    airplanes.value = AirplaneController.getAirplanes()
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  void changeSort(int value) {
    if (sort.value == value) {
      return;
    }
    sort.value = value;
    airplanes.value = airplanes.reversed.toList();
  }
}
