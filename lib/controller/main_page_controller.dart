import 'package:airplane/pages/add_ticket_page.dart';
import 'package:airplane/pages/airplanes_page.dart';
import 'package:airplane/pages/find_same_flight.dart';
import 'package:airplane/pages/flights_of_day_page.dart';
import 'package:airplane/pages/flights_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/cities_page.dart';

class MainPageController extends GetxController {
  Widget currentPage = const FlightsOfDayPage();
  bool showDrawer = true;
  double drawerSize = 0;
  var selectedPage = 0;

  List pages = [
    const FlightsOfDayPage(), //page 0
    const FlightsPage(), //page 1
    const AirplanesPage(), //page 2
    const CitiesPage(), //page 3
    AddTicketPage(), //page 4
    FindTwoPassengerPage() //page5
  ];

  final List menuItems = [
    ["Flights of day", Icons.today_rounded, 0],
    ["Flights", Icons.airlines_rounded, 1],
    ["Airplanes", Icons.airplanemode_active_rounded, 2],
    ["Cities", Icons.location_city_outlined, 3],
    ["Add Ticket", Icons.airplane_ticket_rounded, 4],
    ["", Icons.more_horiz_rounded, 5]
  ];

  void changePage(int pageNumber) {
    currentPage = pages[pageNumber];
    selectedPage = pageNumber;
    update();
  }

  void changeDrawerMode() async {
    showDrawer = !showDrawer;
    update();
  }
}
