import 'package:airplane/controller/flights_controller.dart';
import 'package:airplane/controller/passenger_controller.dart';
import 'package:airplane/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import "../ADT/stack.dart" as stack;

class FindSameFlightPageController extends GetxController {
  TextEditingController passenger1 = TextEditingController();
  TextEditingController passenger2 = TextEditingController();

  var flights = [];

  List getFlights() {
    stack.Stack list = stack.Stack();
    Passenger? passenger1Person =
        PassengerController.getPassenger(passenger1.text);
    Passenger? passenger2Person =
        PassengerController.getPassenger(passenger2.text);
    List? passenger1Flights = passenger1Person?.getFlights();

    if (passenger1Person == null) {
      return [];
    }
    if (passenger2Person == null) {
      return [];
    }
    if (passenger1Flights == null) {
      return [];
    }

    for (Flight flight in passenger1Flights as List) {
      if (passenger2Person.flightExist(flight.flightName) == true) {
        list.push(flight);
      }
    }

    return list.toArray().toList();
  }

  void submitPressed() {
    flights = getFlights();
    update();
  }
}
