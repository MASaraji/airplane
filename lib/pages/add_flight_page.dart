import 'package:airplane/controller/airplane_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../controller/add_flight_page_controller.dart';
import '../controller/cities_controller.dart';

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
        onPressed: () {},
        child: const Text("Add", style: TextStyle(fontSize: 20)));
  }

  Widget priceInput() {
    return TextFormField(
        controller: TextEditingController(text: controller.price),
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Price"));
  }

  Widget cityNameInput() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      // controller: nameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Can't be empty";
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Name",
        hintText: "Enter Name",
      ),
    );
  }

  Widget departTimeInput(BuildContext ctx) {
    return TextField(
      controller: TextEditingController(text: controller.departTime.toString()),
      readOnly: true,
      decoration: const InputDecoration(
          // ignore: unnecessary_const
          border: const OutlineInputBorder(),
          label: Text("Depart Time")),
      onTap: () {
        showTimePicker(context: ctx, initialTime: TimeOfDay.now());
      },
    );
  }

  Widget arrivalTimeInput(BuildContext ctx) {
    return TextField(
      controller:
          TextEditingController(text: controller.arrivalTime.toString()),
      readOnly: true,
      decoration: const InputDecoration(
          // ignore: unnecessary_const
          border: const OutlineInputBorder(),
          label: Text("Arrival Time")),
      onTap: () {
        showTimePicker(context: ctx, initialTime: TimeOfDay.now());
      },
    );
  }

  Widget airplaneDropBox() {
    return DropdownButton(
        value: controller.airplane!.name,
        items: AirplaneController.airplanes.values
            .toList()
            .map((e) => DropdownMenuItem(value: e.model, child: Text(e.name)))
            .toList(),
        onChanged: (_) {},
        hint: const Text("Airplane"));
  }

  Widget departDateInput(BuildContext ctx) {
    return TextField(
      controller: TextEditingController(text: controller.departDate.toString()),
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
        value: controller.originCity!.name,
        items: CitiesController.getCities()
            .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name)))
            .toList(),
        onChanged: (_) {},
        hint: const Text("Origin City"));
  }

  Widget destinationCityDropBox() {
    return DropdownButton(
        value: controller.destinationCity!.name,
        items: CitiesController.getCities()
            .map((e) => DropdownMenuItem(value: e.name, child: Text(e.name)))
            .toList(),
        onChanged: (_) {},
        hint: const Text("Destination City"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(),
        body: Stack(children: [
          //background(),
          Obx(
            () => Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
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
          )
        ]));
  }
}
