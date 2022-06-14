import 'package:airplane/controller/cities_controller.dart';
import 'package:airplane/controller/cities_page_controller.dart';
import 'package:airplane/widgets/toolbar.dart';
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
      child: Container(
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
        onPressed: () {},
        icon: const Icon(Icons.sort, color: Colors.blue));
  }

  Widget searchBox() {
    return TextField(
      onChanged: (pattern) {
        controller.getCities(pattern);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Search",
          floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }

  Widget searchBoxAnimation() {
    return AnimatedContainer(
        width: controller.showSearchBox ? 300 : 0,
        margin: const EdgeInsets.symmetric(vertical: 5),
        duration: const Duration(milliseconds: 500),
        child:
            !controller.showSearchBox ? const SizedBox.shrink() : searchBox());
  }

  Widget toolbarMenu() {
    return Toolbar(
        buttons: [searchButton(), searchBoxAnimation(), addCityButton()],
        endButton: changeOrderButton());
  }

  Widget decorationPage() {
    return Expanded(
        child: Stack(
      fit: StackFit.expand,
      children: [
        backgroundImage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
        child:
            Image.asset("assets/images/background_city.png", fit: BoxFit.fill));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CitiesPageController());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      decorationPage(),
      Expanded(
        child: Column(
          children: [
            GetBuilder<CitiesPageController>(
                init: controller, builder: (ctx) => toolbarMenu()),
            const Divider(
              height: 5,
              color: Colors.blue,
              thickness: 2,
            ),
            GetBuilder(init: controller, builder: (ctx) => itemsList())
          ],
        ),
      )
    ]);
  }
}
