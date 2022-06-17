import 'package:airplane/pages/add_ticket_page.dart';
import 'package:airplane/pages/airplane_info_page.dart';
import 'package:airplane/pages/airplanes_page.dart';
import 'package:airplane/pages/flights_of_day_page.dart';
import 'package:airplane/pages/flights_page.dart';
import 'package:get/get.dart';

import '../pages/cities_page.dart';

class MainPageController extends GetxController {
  dynamic currentPage = const FlightsOfDayPage();
  bool showDrawer = true;
  double drawerSize = 0;
  int selectedPage = 0;

  List pages = [
    const FlightsOfDayPage() //page 0
    ,
    const FlightsPage(), //page 1
    const AirplanesPage(), //page 2
    const CitiesPage() //page 3
    ,

    AddTicketPage(), //page 4
    const CitiesPage() //page 3
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
