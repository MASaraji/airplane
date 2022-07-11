import 'package:airplane/controller/find_same_flight_page_controller.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models.dart';
import '../widgets/item_card.dart';
import '../widgets/snackbar.dart';

class FindTwoPassengerPage extends GetView<FindSameFlightPageController> {
  const FindTwoPassengerPage({Key? key}) : super(key: key);

  Widget passenger1() => TextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: controller.passenger1,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "passenger 1",
          hintText: "Enter Name",
        ),
      );

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
            return ItemCard(title: flight.flightName, subtitle: "");
          },
        ),
      ),
    );
  }

  Widget submit() {
    return ElevatedButton(
        onPressed: () {
          if (controller.passenger1.text.isEmpty) {
            Snackbar.snackbarError(
                "Passenger 1 is empty.Please enter passenger 1");
          }
          if (controller.passenger2.text.isEmpty) {
            Snackbar.snackbarError(
                "Passenger 2 is empty.Please enter passenger 2");
          }
          controller.submitPressed();
        },
        child: const Text("submit"));
  }

  Widget passenger2() => TextField(
        controller: controller.passenger2,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "passenger 2",
          hintText: "Enter Name",
        ),
      );
  @override
  Widget build(BuildContext context) {
    Get.put(FindSameFlightPageController());
    return Column(
      children: [
        passenger1(),
        const SizedBox(
          height: 10,
        ),
        passenger2(),
        const SizedBox(
          height: 10,
        ),
        GetBuilder(
          builder: (builder) => itemsList(),
          init: controller,
        ),
        const SizedBox(height: 30),
        submit(),
      ],
    );
  }
}
