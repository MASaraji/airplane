import 'package:airplane/pages/add_airplane_page.dart';
import 'package:airplane/pages/add_city_page.dart';
import 'package:airplane/pages/add_flight_page.dart';
import 'package:airplane/pages/home_page.dart';
import 'package:airplane/pages/welcome_page.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

void main() => runApp(app);

GetMaterialApp app = GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    getPages: routes,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(centerTitle: true),
      useMaterial3: true,
      primaryColor: Colors.blue,
    ));

List<GetPage> routes = [
  GetPage(name: "/", page: () => const WelcomePage()),
  GetPage(name: "/mainPage", page: () => HomePage()),
  GetPage(name: "/addAirplanePage", page: () => const AddAirplanePage()),
  GetPage(name: "/addCityPage", page: () => const AddCityPage()),
  GetPage(name: "/addFlightPage", page: () => const AddFlightPage())
];
