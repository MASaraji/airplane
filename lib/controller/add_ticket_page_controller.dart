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

  late String firstName;
  late String lastName;
  late String nationalCode;
  late int phone;

  void setFlight(Flight flight_) {
    flight = flight_;
    airplane = flight!.airplane!;
    departTime = flight!.departureTime;
    arrivalTime = flight!.landingTime;
    price = flight!.price;
    originCity = flight!.originCity!;
    destinationCity = flight!.destinationCity!;
    cap = flight!.airplane!.capacity;
    soldedTicket = flight!.tickets.length;
    update();
  }

  void addPassenger() {
    Passenger passenger = Passenger(
      name: "$firstName $lastName",
      nationalCode: nationalCode,
    );
    passenger.addPhone(phone);
    Ticket ticket = Ticket(passenger: passenger, price: price as double);
    flight!.addTicket(ticket);
  }
}
