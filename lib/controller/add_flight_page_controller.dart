import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../models.dart';
import '../widgets/texts.dart';

class AddFlightPageController extends GetxController {
  String? flightName;
  TextEditingController priceController = TextEditingController();

  TextEditingController departDateController = TextEditingController();
  TextEditingController departTimeController = TextEditingController();
  TextEditingController arrivalTimeController = TextEditingController();
  late Airplane airplane;
  late City originCity;
  late City destinationCity;
  DateTime? departDate;
  TimeOfDay? departTime;
  TimeOfDay? arrivalTime;
  late double price;
}
