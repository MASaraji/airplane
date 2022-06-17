import 'package:airplane/controller/airplane_controller.dart';
import "package:flutter/material.dart";

import '../controller/cities_controller.dart';

class AddFlightPage extends StatelessWidget {
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
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Depart Time")),
      onTap: () {
        showTimePicker(context: ctx, initialTime: TimeOfDay.now());
      },
    );
  }

  Widget arrivalTimeInput(BuildContext ctx) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Arrival Time")),
      onTap: () {
        showTimePicker(context: ctx, initialTime: TimeOfDay.now());
      },
    );
  }

  Widget airplaneDropBox() {
    return DropdownButton(
        items: AirplaneController.airplanes.values
            .toList()
            .map((e) => DropdownMenuItem(child: Text(e.name), value: e.model))
            .toList(),
        onChanged: (text) => print(text),
        hint: Text("Airplane"));
  }

  Widget originCityDropBox() {
    return DropdownButton(
        items: CitiesController.getCities()
            .map((e) => DropdownMenuItem(child: Text(e.name), value: e.name))
            .toList(),
        onChanged: (text) => print(text),
        hint: Text("Origin City"));
  }

  Widget destinationCityDropBox() {
    return DropdownButton(
        items: CitiesController.getCities()
            .map((e) => DropdownMenuItem(child: Text(e.name), value: e.name))
            .toList(),
        onChanged: (text) => print(text),
        hint: Text("Destination City"));
  }

  @override
  Widget build(BuildContext context) {
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
                    priceInput(),
                    SizedBox(height: 20),
                    Row(children: [
                      Expanded(flex: 10, child: departTimeInput(context)),
                      Spacer(flex: 1),
                      Expanded(flex: 10, child: arrivalTimeInput(context)),
                    ]),
                    SizedBox(height: 20),
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
          )
        ]));
  }
}
