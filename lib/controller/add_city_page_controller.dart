import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'cities_controller.dart';

class AddCityPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  String getName() => nameController.text;

  bool addCity() => CitiesController.addCity(nameController.text);
}
