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
            side: BorderSide(color: Colors.black.withOpacity(.2), width: 2)),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
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
      tooltip: "Search",
      onPressed: controller.changeSearchBoxMode,
      icon: const Icon(Icons.search),
    );
  }

  Widget addCityButton() {
    return IconButton(
      splashRadius: 25,
      onPressed: () =>
          Get.toNamed("/addCityPage")?.then((_) => {controller.getCities()}),
      tooltip: "Add city",
      icon: const Icon(Icons.add),
    );
  }

  Widget changeOrderDialog() {
    return AlertDialog(
      title: const Text("Change Order"),
      contentPadding: EdgeInsets.zero,
      content: Obx(
        () => Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(
              leading: Radio(
                  value: 1,
                  groupValue: controller.sort.value,
                  onChanged: (value) {
                    controller.changeSort(1);
                  }),
              title: const Text("Ascending")),
          ListTile(
              leading: Radio(
                  value: 2,
                  groupValue: controller.sort.value,
                  onChanged: (value) {
                    controller.changeSort(2);
                  }),
              title: const Text("Descending"))
        ]),
      ),
    );
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25,
        tooltip: "Change Order",
        onPressed: () => Get.dialog(changeOrderDialog()),
        icon: const Icon(Icons.sort));
  }

  Widget searchBox() {
    return TextField(
      onChanged: (pattern) => controller.getCities(pattern),
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
    return Toolbar(
        buttons: [searchButton(), searchBoxAnimation(), addCityButton()],
        endButton: changeOrderButton());
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
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
          color: const Color.fromARGB(255, 107, 170, 241),
          child: Stack(
            fit: StackFit.expand,
            children: const [
              AnalogClock(
                textScaleFactor: 1.5,
                tickColor: Colors.white,
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
              Obx(citiesNumberWidget),
              clockWidget(),
            ]))
      ])),
      Expanded(
          child: Obx(() => Column(children: [toolbarMenu(), itemsList()]))),
    ]);
  }
}
