import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../widgets/item_card.dart';
import '../widgets/texts.dart';
import '../widgets/toolbar.dart';

class FlightsPage extends StatelessWidget {
  const FlightsPage({Key? key}) : super(key: key);
  Widget itemsList() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          primary: false,
          itemCount: 5,
          itemBuilder: (ctx, int index) {
            return ItemCard(
              title: "hello",
              subtitle: "hello",
            );
          },
        ),
      ),
    );
  }

  Widget changeCityButton() {
    return IconButton(
      splashRadius: 25,
      splashColor: Colors.blueAccent,
      onPressed: () {},
      icon: const Icon(Icons.location_on),
      color: Colors.blue,
    );
  }

  Widget addFlight() {
    return IconButton(
        color: Colors.blue,
        onPressed: () {
          Get.toNamed("/addFlightPage");
        },
        icon: const Icon(Icons.add));
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25,
        splashColor: Colors.blueAccent,
        onPressed: () {},
        icon: const Icon(Icons.sort, color: Colors.blue));
  }

  Widget toolbarMenu(BuildContext context) {
    return Toolbar(
        buttons: [changeCityButton(), addFlight()],
        endButton: changeOrderButton());
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
          child: Image.network(
              "https://cdn.dribbble.com/users/1875932/screenshots/6492790/airportewageruzel.jpg",
              fit: BoxFit.fill)),
    ));
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
                      Texts.pageTitle("Flights"),
                      Texts.timeText(),
                    ],
                  ),
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
          children: [
            toolbarMenu(context),
            const Divider(
              height: 5,
              color: Colors.blue,
              thickness: 2,
            ),
            itemsList()
          ],
        ),
      ))
    ]);
  }
}
