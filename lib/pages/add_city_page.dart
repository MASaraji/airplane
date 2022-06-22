import 'package:airplane/controller/add_city_page_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../widgets/snackbar.dart';

class AddCityPage extends GetView<AddCityPageController> {
  const AddCityPage({Key? key}) : super(key: key);

  Widget background() {
    return Image.asset("assets/images/city.png", fit: BoxFit.fill);
  }

  AppBar appbar() {
    return AppBar(
      title: const Text("Add City"),
    );
  }

  Widget cityNameInput() {
    return TextFormField(
      autofocus: true,
      textInputAction: TextInputAction.next,
      controller: controller.nameController,
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
          if (controller.getName().isEmpty) {
            Snackbar.snackbarError("Please enter city name.");
          } else {
            bool success = controller.addCity();
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
    Get.put(AddCityPageController());
    return Scaffold(
        appBar: appbar(),
        body: Stack(children: [
          Positioned.fill(child: background()),
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
