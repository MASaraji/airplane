import 'package:airplane/controller/airplane_controller.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../widgets/snackbar.dart';

class AddAirplanePage extends StatelessWidget {
  AddAirplanePage({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();

  final TextEditingController modelController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  AppBar appBar(String title) {
    return AppBar(title: Text(title));
  }

  Widget backgroundImage() {
    return Positioned.fill(
        child: Image.network(
      "https://cdn.dribbble.com/users/1733140/screenshots/15699220/media/81cdcc8d3783b37e5ab15ad5a74af121.png",
      fit: BoxFit.fill,
    ));
  }

  Widget nameInput() {
    return TextField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Name",
        hintText: "Enter Name",
      ),
    );
  }

  Widget modelInput() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "can't be empty";
        }
        return null;
      },
      controller: modelController,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Model",
        hintText: "Enter Model",
      ),
    );
  }

  Widget capacityInput() {
    return TextField(
      controller: capacityController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Capacity",
        hintText: "Enter Capacity",
      ),
    );
  }

  Widget addButton() {
    return ElevatedButton(
        onPressed: () {
          if (nameController.text.isEmpty == true) {
            Snackbar.snackbarError("Please enter airplane name.");
          } else if (modelController.text.isEmpty == true) {
            Snackbar.snackbarError("Please enter airplane model.");
          } else if (capacityController.text.isEmpty == true) {
            Snackbar.snackbarError("Please enter airplane capacity.");
          } else {
            bool success = AirplaneController.addAirplane(nameController.text,
                modelController.text, int.parse(capacityController.text));
            if (success == true) {
              Get.offNamed("/mainPage");
            } else {
              Get.snackbar(
                  "Error", "airplane already Exist.please change airplane name",
                  backgroundColor: Colors.blue,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white);
            }
          }
        },
        child: const Text("Add", style: TextStyle(fontSize: 20)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Add Airplane"),
        body: Stack(children: [
          backgroundImage(),
          Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: nameInput()),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Row(
                  children: [
                    Expanded(flex: 10, child: modelInput()),
                    const Spacer(flex: 1),
                    Expanded(flex: 4, child: capacityInput()),
                  ],
                ),
              ),
              SizedBox(width: 150, height: 50, child: addButton()),
            ],
          )
        ]));
  }
}
