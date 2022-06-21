import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models.dart';

class AddTicketPageController extends GetxController {
  Flight? flight;
  Airplane? airplane;
  TimeOfDay? departTime;
  TimeOfDay? arrivalTime;
  double? price;
  City? originCity;
  City? destinationCity;
  int? cap;
  int? soldedTicket;

  void setFlight(Flight flight) {
    flight = flight;
    airplane = flight.airplane;
    departTime = flight.departureTime;
    arrivalTime = flight.landingTime;
    price = flight.price;
    originCity = flight.originCity;
    destinationCity = flight.destinationCity;
    cap = flight.airplane!.capacity;
    soldedTicket = flight.tickets.length;
  }
}
