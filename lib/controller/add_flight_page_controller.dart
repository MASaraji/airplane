import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import "package:airplane/controller/flights_controller.dart";
import 'package:intl/intl.dart';
import '../models.dart';
import 'airplane_controller.dart';
import 'cities_controller.dart';

class AddFlightPageController extends GetxController {
  late String flightName = FlightsController.getFlightNum().toString();
  late Airplane airplane;
  late City originCity;
  late City destinationCity;
  DateTime departDate = DateTime.now();
  TimeOfDay departTime = TimeOfDay.now();
  TimeOfDay arrivalTime = TimeOfDay.now();
  double price = 0;
  void addDestinationCity(City destinationCity_) =>
      destinationCity = destinationCity_;

  void addDepartDate(DateTime? departDate_) =>
      departDate = departDate_ ?? departDate;

  void addAirplane(Airplane airplane_) => airplane = airplane_;

  void addArrivalTime(TimeOfDay? arrivalTime_) =>
      arrivalTime = arrivalTime_ ?? arrivalTime;

  void addDepartTime(TimeOfDay? departTime_) =>
      departTime = departTime_ ?? departTime;

  void addPrice(String price_) =>
      price_.isNotEmpty ? price = double.parse(price_) : null;

  void addOriginCity(City originCity_) => originCity = originCity_;

  void addFlight() {
    String departDate_ = DateFormat(" EEEE, MM, yyyy").format(departDate);
    Flight flight = Flight(
        price: price,
        originCity: originCity,
        landingTime: arrivalTime,
        flightName: flightName,
        destinationCity: destinationCity,
        airplane: airplane,
        departDate: departDate_,
        departureTime: departTime);
    FlightsController.addFlight(departDate_, flight);
  }

  List getAirplanes() => AirplaneController.airplanes.values.toList();

  List getCities() => CitiesController.getCities();
}
