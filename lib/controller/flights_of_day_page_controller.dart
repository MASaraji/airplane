import 'package:get/get.dart';
import 'flights_controller.dart';

class FlightsOfDayPageController extends GetxController {
  DateTime date = DateTime.now();
  DateTime dateSpecial = DateTime.now();
  var flights = [].obs;

  void getFlights(DateTime? date_) {
    if (date_ != null) {
      date = date_; //DateFormat(" EEEE, MM, yyyy").format(date_)
    }
    flights.value = FlightsController.getFlightByDate(date);
  }

  void setDateSpecial(DateTime? date_) => dateSpecial = date_ ?? dateSpecial;
}
