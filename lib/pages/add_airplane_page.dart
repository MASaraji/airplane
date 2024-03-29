import 'package:airplane/controller/add_airplane_page_controller.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widgets/snackbar.dart';

class AddAirplanePage extends GetView<AddAirplanePageController> {
  const AddAirplanePage({Key? key}) : super(key: key);

  AppBar appBar(String title) => AppBar(title: Text(title));

  Widget backgroundImage() =>
      Image.asset("assets/images/addAirplane.png", fit: BoxFit.fill);

  Widget nameInput() => TextField(
        controller: controller.nameController,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Name",
          hintText: "Enter Name",
        ),
      );

  Widget modelInput() => TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "can't be empty";
          }
          return null;
        },
        controller: controller.modelController,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Model",
          hintText: "Enter Model",
        ),
      );

  Widget capacityInput() => TextField(
        controller: controller.capacityController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Capacity",
          hintText: "Enter Capacity",
        ),
      );

  Widget addButton() => ElevatedButton(
      onPressed: () {
        if (controller.getName().isEmpty) {
          Snackbar.snackbarError("Please enter airplane name.");
        } else if (controller.getModel().isEmpty) {
          Snackbar.snackbarError("Please enter airplane model.");
        } else if (controller.getCapacity().isEmpty) {
          Snackbar.snackbarError("Please enter airplane capacity.");
        } else {
          bool success = controller.addAirplane();
          if (success == true) {
            Get.offNamed("/mainPage");
          } else {
            Snackbar.snackbarError(
                "Airplane already Exist.Please change airplane name.");
          }
        }
      },
      child: const Text("Add", style: TextStyle(fontSize: 20)));

  @override
  Widget build(BuildContext context) {
    Get.put(AddAirplanePageController());
    return Scaffold(
        appBar: appBar("Add Airplane"),
        body: Stack(children: [
          Positioned.fill(child: backgroundImage()),
          Positioned(
              top: 20,
              left: 50,
              right: 50,
              child: Column(
                children: [
                  nameInput(),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(flex: 10, child: modelInput()),
                      const Spacer(),
                      Expanded(flex: 4, child: capacityInput()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(width: 150, height: 50, child: addButton()),
                ],
              ))
        ]));
  }
}
