import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import "package:airplane/controller/flights_controller.dart";
import 'package:intl/intl.dart';
import '../models.dart';

class AddFlightPageController extends GetxController {
  String? flightName;
  late Airplane airplane;
  late City originCity;
  late City destinationCity;
  DateTime departDate=DateTime.now();
  TimeOfDay departTime=TimeOfDay.now();
  TimeOfDay arrivalTime=TimeOfDay.now();
   double price=0;

  void addFlight(){
    String departDate_= DateFormat(" EEEE, MM, yyyy")
                .format(departDate);
    Flight  flight=Flight(price: price, originCity: originCity, landingTime: arrivalTime, flightName: FlightsController.getFlightNum().toString() ,destinationCity: destinationCity, airplane: airplane, departDate:departDate_, departureTime: departTime
  
    );
    FlightsController.addFlight(departDate_, flight);

  }
}
