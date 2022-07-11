import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import "package:airplane/controller/flights_controller.dart";
import '../models.dart';
import 'airplane_controller.dart';
import 'cities_controller.dart';
import "../ADT/stack.dart" as stack;

class AddFlightPageController extends GetxController {
  late String flightName = FlightsController.getFlightNum().toString();
  Airplane? airplane;
  City? originCity;
  City? destinationCity;
  DateTime departDate = DateTime.now();
  TimeOfDay departTime = TimeOfDay.now();
  TimeOfDay arrivalTime = TimeOfDay.now();
  double price = 0;

  void addDestinationCity(City destinationCity_) {
    destinationCity = destinationCity_;
    update();
  }

  void addDepartDate(DateTime? departDate_) {
    departDate = departDate_ ?? departDate;
    update();
  }

  void addAirplane(Airplane airplane_) {
    airplane = airplane_;
    update();
  }

  void addArrivalTime(TimeOfDay? arrivalTime_) {
    arrivalTime = arrivalTime_ ?? arrivalTime;
    update();
  }

  void addDepartTime(TimeOfDay? departTime_) {
    departTime = departTime_ ?? departTime;
    update();
  }

  void addPrice(String price_) =>
      price_.isNotEmpty ? price = double.parse(price_) : null;

  void addOriginCity(City originCity_) {
    originCity = originCity_;
    update();
  }

  List getAirplanes() {
    var airplanes = AirplaneController.airplanes.getValues();
    stack.Stack specifiedAirplanes = stack.Stack();
    Day? day = FlightsController.getDay(departDate);
    if (day == null) {
      return airplanes.toList();
    }
    for (Airplane airplane in airplanes.traverse()) {
      if (day.getFlight(airplane.name) == null) {
        specifiedAirplanes.push(airplane);
      }
    }
    return specifiedAirplanes.toArray().toList();
  }

  void addFlight() {
    //String departDate_ = DateFormat(" EEEE, MM, yyyy").format(departDate);
    Flight flight = Flight(
        price: price,
        originCity: originCity,
        landingTime: arrivalTime,
        flightName: flightName,
        destinationCity: destinationCity,
        airplane: airplane as Airplane,
        departDate: departDate,
        departureTime: departTime);
    FlightsController.addFlight(departDate, flight);
  }

  List getCities() => CitiesController.getCities();
}
