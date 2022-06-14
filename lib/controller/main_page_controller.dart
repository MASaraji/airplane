import 'package:airplane/pages/airplanes_page.dart';
import 'package:airplane/pages/flights_of_day_page.dart';
import 'package:airplane/pages/flights_page.dart';
import 'package:get/get.dart';

import '../pages/cities_page.dart';

class MainPageController extends GetxController {
  dynamic currentPage = const FlightsOfDayPage();
  bool showDrawer = true;
  double drawerSize = 0;

  List pages = [
    const FlightsOfDayPage() //page 0
    ,
    const FlightsPage(), //page 1
    const AirplanesPage(), //page 2
    CitiesPage() //page 3
    ,
  ];

  void changePage(int pageNumber) {
    currentPage = pages[pageNumber];
    update();
  }

  void changeDrawerMode() async {
    showDrawer = !showDrawer;

    update();
  }
}