import 'package:airplane/controller/airplane_controller.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
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
          controller.addFlight();
          Get.back();
        },
        child: const Text("Add", style: TextStyle(fontSize: 20)));
  }

  Widget priceInput() {
    return TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"^[0-9]+\.?[0-9]*$")),
        ],
        onChanged: (value) =>
            value != "" ? controller.price = double.parse(value) : null,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Price"));
  }

  Widget departTimeInput(BuildContext ctx) {
    return TextField(
      controller: TextEditingController(text: controller.departTime.toString()),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Depart Time")),
      onTap: () async {
        TimeOfDay? value =
            await showTimePicker(context: ctx, initialTime: TimeOfDay.now());
        controller.departTime = value ?? controller.departTime;
      },
    );
  }

  Widget arrivalTimeInput(BuildContext ctx) {
    return TextField(
      controller:
          TextEditingController(text: controller.arrivalTime.toString()),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Arrival Time")),
      onTap: () async {
        TimeOfDay? value =
            await showTimePicker(context: ctx, initialTime: TimeOfDay.now());
        controller.arrivalTime = value ?? controller.arrivalTime;
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
    return TextFormField(
        controller: TextEditingController(
            text: DateFormat(" EEEE, MM, yyyy").format(controller.departDate)),
        readOnly: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Depart Date")),
        onTap: () async {
          DateTime? value = await showDatePicker(
              context: ctx,
              lastDate: DateTime.now().add(const Duration(days: 365)),
              firstDate: DateTime.now(),
              initialDate: DateTime.now());

          controller.departDate = value ?? controller.departDate;
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
