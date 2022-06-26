import 'package:airplane/controller/add_city_page_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../widgets/snackbar.dart';

class AddCityPage extends GetView<AddCityPageController> {
  const AddCityPage({Key? key}) : super(key: key);

  Widget background() =>
      Image.asset("assets/images/city.png", fit: BoxFit.fill);

  AppBar appbar() => AppBar(
        title: const Text("Add City"),
      );

  Widget cityNameInput() => TextFormField(
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

  Widget addButton() => ElevatedButton(
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

  @override
  Widget build(BuildContext context) {
    Get.put(AddCityPageController());
    return Scaffold(
        appBar: appbar(),
        body: Stack(children: [
          Positioned.fill(child: background()),
          Positioned(
              left: 50,
              right: 50,
              top: 20,
              child: Column(
                children: [
                  cityNameInput(),
                  const SizedBox(height: 20),
                  SizedBox(width: 150, height: 50, child: addButton()),
                ],
              ))
        ]));
  }
}
