import 'package:airplane/controller/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models.dart';

class AddTicketPageController extends GetxController {
// flight  information
  Flight? flight;
  Airplane? airplane;
  TimeOfDay? departTime;
  TimeOfDay? arrivalTime;
  double? price;
  City? originCity;
  City? destinationCity;
  int? cap;
  int? soldedTicket;
//passenger information
  String? firstName;
  String? lastName;
  String? nationalCode;
  int? phone;

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

  void clearBoxes() {
    flight = null;
    airplane = null;
    departTime = null;
    arrivalTime = null;
    price = null;
    originCity = null;
    destinationCity = null;
    cap = null;
    soldedTicket = null;
    firstName = null;
    lastName = null;
    nationalCode = null;
    phone = null;
    update();
  }

  void addPassenger() {
    Passenger? passenger = PassengerController.getPassenger(nationalCode!);
    //check if passenger exist
    if (passenger != null) {
      if (!passenger.phones.contains(phone)) {
        passenger.addPhone(phone as int);
      }
    } else {
      passenger = Passenger(
        name: "$firstName $lastName",
        nationalCode: nationalCode as String,
      );
      passenger.addPhone(phone!);
      PassengerController.addPassenger(passenger);
    }
    Ticket ticket = Ticket(passenger: passenger, price: price as double);
    flight!.addTicket(ticket);
    clearBoxes();
  }
}
