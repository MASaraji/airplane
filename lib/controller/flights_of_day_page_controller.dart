import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'flights_controller.dart';

class FlightsOfDayPageController extends GetxController {
  String date = DateTime.now().toString();
  DateTime dateSpecial = DateTime.now();
  var flights = [].obs;

  void getFlights(DateTime? date_) {
    if (date_ != null) date = DateFormat(" EEEE, MM, yyyy").format(date_);
    flights.value = FlightsController.getFlightByDate(date);
  }

  void setDateSpecial(DateTime? date_) => dateSpecial = date_ ?? dateSpecial;
}
