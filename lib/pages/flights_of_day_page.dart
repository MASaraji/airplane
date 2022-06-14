import 'package:airplane/controller/main_page_controller.dart';
import 'package:airplane/widgets/item_card.dart';
import 'package:airplane/widgets/toolbar.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../widgets/texts.dart';

class FlightsOfDayPage extends GetView<MainPageController> {
  const FlightsOfDayPage({Key? key}) : super(key: key);
  Widget itemsList() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        //  decoration:
        //    BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (ctx, int index) {
            return const ItemCard(title: "hello", subtitle: "hello");
          },
        ),
      ),
    );
  }

  Widget pageTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "lato"),
    );
  }

  Widget searchButton() {
    return IconButton(
      splashRadius: 25,
      splashColor: Colors.blueAccent,
      onPressed: () {},
      icon: const Icon(Icons.search),
      color: Colors.blue,
    );
  }

  Widget changeTimeButton(BuildContext context) {
    return IconButton(
        onPressed: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2025));
        },
        tooltip: "",
        icon: const Icon(Icons.calendar_today_rounded),
        color: Colors.blue);
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
        buttons: [searchButton(), changeTimeButton(context)],
        endButton: changeOrderButton());
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Stack(
        fit: StackFit.expand,
        children: [
          GetBuilder<MainPageController>(
              init: controller,
              builder: (ctx) => Positioned.fill(
                  child: Image.network(
                      "https://cdn.dribbble.com/users/2146089/screenshots/6237820/preview_4x.png",
                      fit: controller.showDrawer == true
                          ? BoxFit.cover
                          : BoxFit.fitWidth))),
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
                      Texts.pageTitle("Flights of day"),
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
