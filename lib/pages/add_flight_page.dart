import 'package:airplane/controller/airplane_controller.dart';
import 'package:airplane/controller/flights_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/add_flight_page_controller.dart';
import '../controller/cities_controller.dart';
import '../models.dart';

class AddFlightPage extends GetView<AddFlightPageController> {
  const AddFlightPage({Key? key}) : super(key: key);

  AppBar appbar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Add Flight"),
    );
  }

  Widget addButton() {
    return ElevatedButton(
        onPressed: () {
          Flight flight = Flight(
            flightName: FlightsController.lastAddedAirplane.toString(),
            price: controller.price,
            departureTime: controller.departTime as TimeOfDay,
            landingTime: controller.arrivalTime as TimeOfDay,
            departDate: DateFormat(" EEEE, MM, yyyy")
                .format(controller.departDate as DateTime),
            airplane: controller.airplane,
            originCity: controller.originCity,
            destinationCity: controller.destinationCity,
          );
          FlightsController.addFlight(
              DateFormat(" EEEE, MM, yyyy")
                  .format(controller.departDate as DateTime),
              flight);

          Get.back();
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
    List airplane = AirplaneController.airplanes.values.toList();
    return DropdownButton(
        value: airplane[0],
        items: airplane
            .map((airplane) =>
                DropdownMenuItem(value: airplane, child: Text(airplane.name)))
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
        onTap: () async {
          DateTime value = await showDatePicker(
              context: ctx,
              lastDate: DateTime.now().add(const Duration(days: 365)),
              firstDate: DateTime.now(),
              initialDate: DateTime.now()) as DateTime;
          controller.departDate = value;
        });
  }

  Widget originCityDropBox() {
    List cities = CitiesController.getCities();
    return DropdownButton(
        value: cities[0],
        items: cities
            .map(
                (city) => DropdownMenuItem(value: city, child: Text(city.name)))
            .toList(),
        onChanged: (value) {
          controller.originCity = value as City;
        },
        hint: const Text("Origin City"));
  }

  Widget destinationCityDropBox() {
    List cities = CitiesController.getCities();
    return DropdownButton(
        value: cities[0],
        items: cities
            .map(
                (city) => DropdownMenuItem(value: city, child: Text(city.name)))
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
                      const Spacer(),
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
