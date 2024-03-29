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
  Passenger? passenger;

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
    passenger = null;
    update();
  }

  String? addPassenger() {
    if (flight!.numberOfTicket >= flight!.airplane.capacity) {
      return "All ticket are solded";
    }
    passenger = PassengerController.getPassenger(nationalCode!);
    if (passenger != null) {
      passenger!.addPhone(phone as int);
      if (passenger!.flightExist(flight!.flightName)) {
        return "Passenger already reserved a ticket.";
      }
    } else {
      passenger = Passenger(
        name: "$firstName $lastName",
        nationalCode: nationalCode as String,
      );
      passenger!.addPhone(phone!);
    }
    return null;
  }

  void addTicket() {
    PassengerController.addPassenger(passenger as Passenger);
    passenger!.addFlight(flight!);
    Ticket ticket =
        Ticket(passenger: passenger as Passenger, price: price as double);
    flight!.addTicket(ticket);
    double priceToPay = price! - (price! * (passenger!.discount.percent / 100));
    flight!.airplane.addToProfit(priceToPay);
    passenger!.discount.addToTotal(priceToPay);
    clearBoxes();
  }
}
