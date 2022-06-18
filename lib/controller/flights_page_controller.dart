import 'package:airplane/controller/flights_controller.dart';
import 'package:get/get.dart';

import '../models.dart';

class FlightsPageController extends GetxController {
  var flights = FlightsController.getFlights().obs;

  void addFlight(DateTime date, Flight flight) {
    FlightsController.addFlight(date, flight);
    flights.value = FlightsController.getFlights();
  }
}
