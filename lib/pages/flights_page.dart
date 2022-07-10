// ignore_for_file: unused_local_variable

import 'package:airplane/controller/flights_page_controller.dart';
import 'package:airplane/pages/flight_information_page.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import "../models.dart";
import '../widgets/item_card.dart';
import '../widgets/texts.dart';
import '../widgets/toolbar.dart';

class FlightsPage extends GetView<FlightsPageController> {
  const FlightsPage({Key? key}) : super(key: key);

  Widget itemsList() {
    List flights = controller.flights;
    return Expanded(
      child: Card(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          primary: false,
          itemCount: flights.length,
          itemBuilder: (ctx, int index) {
            Flight flight = flights[index];
            return ItemCard(
              onTap: () => Get.dialog(flightInformationDialog(flight)),
              trailing:
                  "${flight.originCity!.name} to ${flight.destinationCity!.name}",
              title: flight.flightName,
              subtitle: DateFormat(" EEEE, MM, yyyy").format(flight.departDate),
            );
          },
        ),
      ),
    );
  }

  Widget flightInformationDialog(Flight flight) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: FlightInformationPage(flight: flight),
    ));
  }

  Widget changeCityButton() {
    return IconButton(
      splashRadius: 25,
      onPressed: () {},
      icon: const Icon(Icons.location_on),
    );
  }

  Widget addFlight() {
    return IconButton(
        onPressed: () =>
            Get.toNamed("/addFlightPage")!.then((_) => controller.getFlight()),
        icon: const Icon(Icons.add));
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25, onPressed: () {}, icon: const Icon(Icons.sort));
  }

  Widget toolbarMenu() {
    return Toolbar(
        buttons: [changeCityButton(), addFlight()],
        endButton: changeOrderButton());
  }

  Widget backgroundImage() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.black.withOpacity(.2), width: 2),
      ),
      elevation: 10,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset("assets/images/flights.jpg", fit: BoxFit.fill)),
    );
  }

  Widget pageDecoration() {
    return Expanded(
        child: Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(child: backgroundImage()),
        Positioned(
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts.pageTitle("Flights"),
                Texts.timeText(),
              ],
            )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FlightsPageController());
    return Column(children: [
      pageDecoration(),
      toolbarMenu(),
      Obx(itemsList),
    ]);
  }
}
