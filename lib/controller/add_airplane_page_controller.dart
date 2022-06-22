import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'airplane_controller.dart';

class AddAirplanePageController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  String getName() => nameController.text;
  String getModel() => modelController.text;
  String getCapacity() => capacityController.text;

  bool addAirplane() => AirplaneController.addAirplane(nameController.text,
      modelController.text, int.parse(capacityController.text));
}
