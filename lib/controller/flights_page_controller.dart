import 'package:airplane/controller/flights_controller.dart';
import 'package:get/get.dart';

import '../models.dart';

class FlightsPageController extends GetxController {
  var flights = FlightsController.getFlights().obs
    ..sort((a, b) => (a.occupacyRatio).compareTo(b.occupacyRatio));

  void addFlight(DateTime date, Flight flight) {
    FlightsController.addFlight(date, flight);
    flights.value = FlightsController.getFlights();
  }

  void getFlight() => flights.value = FlightsController.getFlights()
    ..sort((a, b) => (a.occupacyRatio).compareTo(b.occupacyRatio));
}
