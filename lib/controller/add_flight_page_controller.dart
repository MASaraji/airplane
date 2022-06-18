import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../models.dart';
import '../widgets/texts.dart';

class AddFlightPageController extends GetxController {
  String? flightName;
  String? price;
  DateTime? departDate;
  DateTime? arrivalTime;
  DateTime? departTime;
  Airplane? airplane;
  City? originCity;
  City? destinationCity;
}
