import 'dart:ui';

import 'package:airplane/controller/cities_page_controller.dart';
import 'package:airplane/widgets/toolbar.dart';
import 'package:analog_clock/analog_clock.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../models.dart';
import '../widgets/item_card.dart';
import '../widgets/texts.dart';

class CitiesPage extends GetView<CitiesPageController> {
  const CitiesPage({Key? key}) : super(key: key);
  Widget itemsList() {
    List cities = controller.cities;
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
            itemCount: cities.length,
            itemBuilder: (ctx, int index) {
              City city = cities[index];
              return ItemCard(title: city.name, subtitle: city.country);
            },
          ),
        ),
      ),
    );
  }

  Widget searchButton() {
    return IconButton(
      splashRadius: 25,
      splashColor: Colors.blueAccent,
      onPressed: () {
        controller.changeSearchBoxMode();
        controller.getCities();
      },
      icon: const Icon(Icons.search),
      color: Colors.blue,
    );
  }

  Widget addCityButton() {
    return IconButton(
        onPressed: () async {
          await Get.toNamed("/addCityPage");
        },
        tooltip: "Add city",
        icon: const Icon(Icons.add),
        color: Colors.blue);
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25,
        splashColor: Colors.blueAccent,
        onPressed: () {
          Get.dialog(AlertDialog(
            title: Text("Change Order"),
            contentPadding: EdgeInsets.zero,
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              for (var i = 1; i <= 3; i++)
                ListTile(
                    leading: Radio(value: i, groupValue: 1, onChanged: (_) {}),
                    title: Text("option $i"))
            ]),
          ));
        },
        icon: const Icon(Icons.sort, color: Colors.blue));
  }

  Widget searchBox() {
    return TextField(
      onChanged: (pattern) {
        controller.getCities(pattern);
      },
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Search",
          floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }

  Widget searchBoxAnimation() {
    return AnimatedContainer(
        width: controller.showSearchBox.value ? 300 : 0,
        margin: const EdgeInsets.symmetric(vertical: 5),
        duration: const Duration(milliseconds: 500),
        child: !controller.showSearchBox.value
            ? const SizedBox.shrink()
            : searchBox());
  }

  Widget toolbarMenu() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue.withOpacity(.5), width: 2)),
      child: Toolbar(
          buttons: [searchButton(), searchBoxAnimation(), addCityButton()],
          endButton: changeOrderButton()),
    );
  }

  Widget decorationPage() {
    return Expanded(
        flex: 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            backgroundImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts.pageTitle("Cities"),
                  Texts.timeText(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget backgroundImage() {
    return Positioned.fill(
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Image.asset("assets/images/background_city.png",
              fit: BoxFit.fill)),
    ));
  }

  Widget citiesNumberWidget() {
    return Expanded(
        flex: 1,
        child: Card(
            elevation: 10,
            color: Colors.lightBlueAccent.shade700,
            child: Stack(fit: StackFit.expand, children: [
              Column(children: [
                Texts.pageTitle("Cities", fontsize: 40),
                Texts.pageTitle("${controller.cities.length}"),
              ])
            ])));
  }

  Widget clockWidget() {
    return Expanded(
        flex: 1,
        child: Card(
          elevation: 10,
          color: Color.fromARGB(255, 107, 170, 241),
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnalogClock(
                textScaleFactor: 1.5,
                digitalClockColor: Colors.black,

                tickColor: Colors.white,
                // minuteHandColor: Colors.white,
                // hourHandColor: Colors.white,
                // numberColor: Colors.white,
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CitiesPageController());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Row(children: [
        decorationPage(),
        Expanded(
            flex: 1,
            child: Column(children: [
              citiesNumberWidget(),
              clockWidget(),
            ]))
      ])),
      Expanded(child: Column(children: [Obx(toolbarMenu), Obx(itemsList)])),
    ]);
  }
}
