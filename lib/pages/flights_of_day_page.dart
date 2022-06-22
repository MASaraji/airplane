import 'package:airplane/controller/flights_of_day_page_controller.dart';
import 'package:airplane/widgets/item_card.dart';
import 'package:airplane/widgets/toolbar.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models.dart';
import '../widgets/texts.dart';
import 'flight_information_page.dart';

class FlightsOfDayPage extends GetView<FlightsOfDayPageController> {
  const FlightsOfDayPage({Key? key}) : super(key: key);

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
                onTap: () => Get.dialog(AlertDialog(
                    content: FlightInformationPage(flight: flight))),
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

  Widget pageTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "lato"),
    );
  }

  Widget changeTimeButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: controller.dateSpecial,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025));
        controller.dateSpecial = pickedDate ?? controller.dateSpecial;
        pickedDate != null
            ? controller.getFlights(
                DateFormat(" EEEE, MM, yyyy").format(pickedDate as DateTime))
            : null;
        controller.getFlights(controller.date);
      },
      tooltip: "",
      icon: const Icon(Icons.calendar_today_rounded),
    );
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25, onPressed: () {}, icon: const Icon(Icons.sort));
  }

  Widget toolbarMenu(BuildContext context) {
    return Toolbar(
        buttons: [changeTimeButton(context)], endButton: changeOrderButton());
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
          child:
              Image.asset("assets/images/flightsOfDay.png", fit: BoxFit.cover)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FlightsOfDayPageController());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child: backgroundImage()),
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
                      Texts.pageTitle("Flights of day"),
                      Texts.timeText(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
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
