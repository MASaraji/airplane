import 'package:airplane/controller/flights_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FlightsOfDayPageController extends GetxController {
  String date = DateTime.now().toString();
  var flights = [].obs;

  void getFlights(String date_) {
    date = date_;
    flights.value = FlightsController.getFlightByDate(date);
  }
}
