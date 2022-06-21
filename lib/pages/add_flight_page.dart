import 'package:airplane/controller/airplane_controller.dart';
import 'package:airplane/controller/flights_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../controller/add_flight_page_controller.dart';
import '../controller/cities_controller.dart';
import '../models.dart';

class AddFlightPage extends GetView<AddFlightPageController> {
  AddFlightPage({Key? key}) : super(key: key);

  AppBar appbar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Add Flight"),
    );
  }

  Widget addButton() {
    return ElevatedButton(
        onPressed: () {
          DateTime departDate =
              DateTime.parse(controller.departDateController.text);
          Flight flight = Flight(
              flightName: FlightsController.lastAddedAirplane.toString(),
              price: double.parse(controller.priceController.text),
              departureTime:
                  DateTime.parse(controller.departTimeController.text),
              landingTime:
                  DateTime.parse(controller.arrivalTimeController.text),
              departDate: departDate,
              airplane: controller.airplane,
              originCity: controller.originCity,
              destinationCity: controller.destinationCity);
          FlightsController.addFlight(departDate, flight);
        },
        child: const Text("Add", style: TextStyle(fontSize: 20)));
  }

  Widget priceInput() {
    return TextFormField(
        onChanged: (value) {
          controller.price = double.parse(value);
        },
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Price"));
  }

  Widget departTimeInput(BuildContext ctx) {
    return TextField(
      controller: controller.departTimeController,
      readOnly: true,
      decoration: const InputDecoration(
          // ignore: unnecessary_const
          border: const OutlineInputBorder(),
          label: Text("Depart Time")),
      onTap: () async {
        TimeOfDay? value =
            await showTimePicker(context: ctx, initialTime: TimeOfDay.now());
        controller.departTime = value;
      },
    );
  }

  Widget arrivalTimeInput(BuildContext ctx) {
    return TextField(
      controller: controller.arrivalTimeController,
      readOnly: true,
      decoration: const InputDecoration(
          // ignore: unnecessary_const
          border: const OutlineInputBorder(),
          label: Text("Arrival Time")),
      onTap: () async {
        TimeOfDay? value =
            await showTimePicker(context: ctx, initialTime: TimeOfDay.now());
        controller.arrivalTime = value;
      },
    );
  }

  Widget airplaneDropBox() {
    return DropdownButton(
        items: AirplaneController.airplanes.values
            .toList()
            .map((e) => DropdownMenuItem(value: e.model, child: Text(e.name)))
            .toList(),
        onChanged: (value) {
          controller.airplane = value as Airplane;
        },
        hint: const Text("Airplane"));
  }

  Widget departDateInput(BuildContext ctx) {
    return TextField(
      controller: controller.departDateController,
      readOnly: true,
      decoration: const InputDecoration(
          // ignore: unnecessary_const
          border: const OutlineInputBorder(),
          label: Text("Depart Date")),
      onTap: () {
        showDatePicker(
            context: ctx,
            lastDate: DateTime.now().add(Duration(days: 365)),
            firstDate: DateTime.now(),
            initialDate: DateTime.now());
      },
    );
  }

  Widget originCityDropBox() {
    return DropdownButton(
        items: CitiesController.getCities()
            .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name)))
            .toList(),
        onChanged: (value) {
          controller.originCity = value as City;
        },
        hint: const Text("Origin City"));
  }

  Widget destinationCityDropBox() {
    return DropdownButton(
        items: CitiesController.getCities()
            .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name)))
            .toList(),
        onChanged: (value) {
          controller.destinationCity = value as City;
        },
        hint: const Text("Destination City"));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddFlightPageController());
    return Scaffold(
        appBar: appbar(),
        body: Stack(children: [
          //background(),

          Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Column(children: [
                    Row(children: [
                      Expanded(flex: 10, child: priceInput()),
                      Spacer(),
                      Expanded(
                        flex: 10,
                        child: departDateInput(context),
                      )
                    ]),
                    const SizedBox(height: 20),
                    Row(children: [
                      Expanded(flex: 10, child: departTimeInput(context)),
                      const Spacer(),
                      Expanded(flex: 10, child: arrivalTimeInput(context)),
                    ]),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        airplaneDropBox(),
                        originCityDropBox(),
                        destinationCityDropBox()
                      ],
                    )
                  ])),
              SizedBox(width: 150, height: 50, child: addButton()),
            ],
          ),
        ]));
  }
}
