import 'package:airplane/controller/passenger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models.dart';
import '../widgets/snackbar.dart';

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
    airplane = flight!.airplane;
    departTime = flight!.departureTime;
    arrivalTime = flight!.landingTime;
    price = flight!.price;
    originCity = flight!.originCity!;
    destinationCity = flight!.destinationCity!;
    cap = flight!.airplane.capacity;
    soldedTicket = flight?.numberOfTicket;
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

  bool addPassenger() {
    Passenger? passenger = PassengerController.getPassenger(nationalCode!);
    if (passenger != null) {
      passenger.addPhone(phone as int);
      if (passenger.flightExist(flight!.flightName)) {
        return false;
      }
    } else {
      passenger = Passenger(
        name: "$firstName $lastName",
        nationalCode: nationalCode as String,
      );
      passenger.addPhone(phone!);
      PassengerController.addPassenger(passenger);
    }
    passenger.addFlight(flight!);
    Ticket ticket = Ticket(passenger: passenger, price: price as double);
    flight!.addTicket(ticket);
    clearBoxes();
    return true;
  }
}
