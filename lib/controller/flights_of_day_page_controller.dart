import 'package:get/get.dart';

import 'flights_controller.dart';

class FlightsOfDayPageController extends GetxController {
  String date = DateTime.now().toString();
  DateTime dateSpecial = DateTime.now();
  var flights = [].obs;

  void getFlights(String date_) {
    date = date_;
    flights.value = FlightsController.getFlightByDate(date);
  }
}
