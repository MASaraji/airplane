import 'package:airplane/controller/airplane_controller.dart';
import 'package:airplane/controller/main_page_controller.dart';
import 'package:airplane/pages/airplane_info_page.dart';
import 'package:airplane/widgets/texts.dart';
import 'package:airplane/widgets/toolbar.dart';
import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../models.dart';
import '../widgets/item_card.dart';

class AirplanesPage extends GetView<MainPageController> {
  const AirplanesPage({Key? key}) : super(key: key);

  Widget itemsList() {
    return Expanded(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blue.withOpacity(.5), width: 2)),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            primary: false,
            itemCount: AirplaneController.getNumAirplane(),
            itemBuilder: (ctx, int index) {
              Airplane airplane = AirplaneController.getAirplane(index);
              return ItemCard(
                  title: airplane.name,
                  subtitle: airplane.model,
                  onTap: () {
                    print("hello");
                    Get.dialog(AlertDialog(
                        title: Text("Airplane Information"),
                        content: airplaneInformationDialog(airplane)));
                  });
            },
          ),
        ),
      ),
    );
  }

  Widget airplaneInformationDialog(Airplane airplane) {
    return SizedBox(
        child: AirplaneInfoPage(airplane: airplane), height: 600, width: 1200);
  }

  Widget addAirplaneButton() {
    return IconButton(
        onPressed: () {
          Get.toNamed("/addAirplanePage");
        },
        tooltip: "Add Airplane",
        icon: const Icon(Icons.add),
        color: Colors.blue);
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25,
        splashColor: Colors.blueAccent,
        onPressed: () {},
        icon: const Icon(Icons.sort, color: Colors.blue));
  }

  Widget backgroundImage() {
    return Positioned.fill(
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.blue.withOpacity(.5), width: 2),
      ),
      elevation: 10,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Image.asset("assets/gifs/airplane.gif", fit: BoxFit.fill)),
    ));
  }

  Widget toolbarMenu() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue.withOpacity(.5), width: 2)),
      child: Toolbar(
          buttons: [addAirplaneButton()], endButton: changeOrderButton()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texts.pageTitle("Airplanes"),
                        Texts.timeText(),
                      ]),
                )
              ],
            ),
          )
        ],
      )),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [toolbarMenu(), itemsList()],
        ),
      ))
    ]);
  }
}
