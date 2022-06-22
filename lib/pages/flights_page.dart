// ignore_for_file: unused_local_variable

import 'package:airplane/controller/flights_page_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
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
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.black.withOpacity(.2), width: 2)),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            primary: false,
            itemCount: flights.length,
            itemBuilder: (ctx, int index) {
              Flight flight = flights[index];
              return ItemCard(
                trailing:
                    "${flight.originCity!.name} => ${flight.destinationCity!.name}",
                title: flight.flightName,
                subtitle: flight.departDate,
              );
            },
          ),
        ),
      ),
    );
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
        onPressed: () {
          Get.toNamed("/addFlightPage")!.then((_) => controller.getFlight());
        },
        icon: const Icon(Icons.add));
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25, onPressed: () {}, icon: const Icon(Icons.sort));
  }

  Widget toolbarMenu(BuildContext context) {
    return Toolbar(
        buttons: [changeCityButton(), addFlight()],
        endButton: changeOrderButton());
  }

  Widget backgroundImage() {
    return Positioned.fill(
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.black.withOpacity(.2), width: 2),
      ),
      elevation: 10,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset("assets/images/flights.jpg",fit:BoxFit.fill)
              ),
    ));
  }

  Widget decorationPage() {
    return Expanded(
        child: Stack(
      fit: StackFit.expand,
      children: [
        backgroundImage(),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Texts.pageTitle("Flights"),
                    Texts.timeText(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FlightsPageController());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      decorationPage(),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [toolbarMenu(context), Obx(itemsList)],
        ),
      ))
    ]);
  }
}
