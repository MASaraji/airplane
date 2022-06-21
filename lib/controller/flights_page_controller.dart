import 'package:airplane/controller/flights_controller.dart';
import 'package:get/get.dart';

import '../models.dart';

class FlightsPageController extends GetxController {
  var flights = FlightsController.getFlights().toList().obs;

  void addFlight(String date, Flight flight) {
    FlightsController.addFlight(date, flight);
    flights.value = FlightsController.getFlights();
  }

  void getFlight() {
    flights.value = FlightsController.getFlights().toList();
  }
}
