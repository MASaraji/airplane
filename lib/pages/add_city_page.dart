import 'package:airplane/controller/cities_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../widgets/snackbar.dart';

class AddCityPage extends StatelessWidget {
  AddCityPage({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();

  Widget background() {
    return Positioned.fill(
        child: Image.asset("assets/images/city.png", fit: BoxFit.fill));
  }

  AppBar appbar() {
    return AppBar(
      title: const Text("Add City"),
      centerTitle: true,
    );
  }

  Widget cityNameInput() {
    return TextFormField(
      autofocus: true,
      textInputAction: TextInputAction.next,
      controller: nameController,
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

  Widget addButton() {
    return ElevatedButton(
        onPressed: () {
          if (nameController.text.isEmpty == true) {
            Snackbar.snackbarError("Please enter city name.");
          } else {
            bool success = CitiesController.addCity(nameController.text);
            if (success == true) {
              Get.back();
            } else {
              Snackbar.snackbarError(
                  "City already exist. Please change city name.");
            }
          }
        },
        child: const Text("Add", style: TextStyle(fontSize: 20)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(),
        body: Stack(children: [
          background(),
          Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: cityNameInput()),
              SizedBox(width: 150, height: 50, child: addButton()),
            ],
          )
        ]));
  }
}
