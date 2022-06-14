import 'package:airplane/controller/cities_controller.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../controller/cities_page_controller.dart';
import '../widgets/snackbar.dart';

class AddCityPage extends StatelessWidget {
  AddCityPage({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add City"),
          centerTitle: true,
        ),
        body: Stack(children: [
          Positioned.fill(
              child: Image.asset("assets/images/city.png", fit: BoxFit.fill)),
          Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: TextFormField(
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
                  )),
              SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (nameController.text.isEmpty == true) {
                          Snackbar.snackbarError("Please enter city name.");
                        } else {
                          bool success =
                              CitiesController.addCity(nameController.text);
                          if (success == true) {
                            Get.toNamed("/mainPage");
                          } else {
                            Snackbar.snackbarError(
                                "City already exist. Please change city name.");
                          }
                        }
                      },
                      child:
                          const Text("Add", style: TextStyle(fontSize: 20)))),
            ],
          )
        ]));
  }
}
