import 'package:airplane/controller/flights_of_day_page_controller.dart';
import 'package:airplane/widgets/item_card.dart';
import 'package:airplane/widgets/toolbar.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../models.dart';
import '../widgets/texts.dart';
import 'flight_information_page.dart';

class FlightsOfDayPage extends GetView<FlightsOfDayPageController> {
  const FlightsOfDayPage({Key? key}) : super(key: key);

  Widget itemsList() {
    List flights = controller.flights;
    return Expanded(
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.black.withOpacity(.2), width: 2)),
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          primary: false,
          itemCount: flights.length,
          itemBuilder: (ctx, int index) {
            Flight flight = flights[index];
            return ItemCard(
              onTap: () => Get.dialog(flightInformationDialog(flight)),
              trailing:
                  "${flight.originCity!.name} => ${flight.destinationCity!.name}",
              title: flight.flightName,
              subtitle: flight.departDate,
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

  Widget changeTimeButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: controller.dateSpecial,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025));

        controller.setDateSpecial(pickedDate);
        controller.getFlights(pickedDate);
      },
      tooltip: "Change Time",
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
                Texts.pageTitle("Flights of day"),
                Texts.timeText(),
              ],
            )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(FlightsOfDayPageController());
    return Column(children: [
      pageDecoration(),
      toolbarMenu(context),
      Obx(itemsList),
    ]);
  }
}
