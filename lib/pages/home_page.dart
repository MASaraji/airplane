import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../controller/main_page_controller.dart';

class HomePage extends GetView<MainPageController> {
  HomePage({Key? key}) : super(key: key);

  Widget drawerButton(String title, IconData icon, int pageNumber) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 20)),
      textColor: Colors.white,
      iconColor: Colors.white,
      style: ListTileStyle.drawer,
      onTap: () => controller.changePage(pageNumber),
    );
  }

  Widget avatar() {
    return const CircleAvatar(
        radius: 70,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.face_unlock_rounded,
          color: Colors.blue,
          size: 100,
        ));
  }

  final List menuItems = [
    ["Flights of day", Icons.today_rounded, 0],
    ["Flights", Icons.airlines_rounded, 1],
    ["Airplanes", Icons.airplanemode_active_rounded, 2],
    ["Cities", Icons.location_city_outlined, 3],
    ["Add Ticket", Icons.airplane_ticket_rounded, 3],
    ["", Icons.more_horiz_rounded, 3]
  ];

  Widget mainDrawer() {
    return Visibility(
      visible: controller.showDrawer,
      child: Drawer(
        backgroundColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            avatar(),
            const SizedBox(height: 70),
            Expanded(
              child: ListView.builder(
                  itemBuilder: ((context, index) => drawerButton(
                      menuItems[index][0],
                      menuItems[index][1],
                      menuItems[index][2])),
                  itemCount: menuItems.length),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainFloatingActionButton() {
    return FloatingActionButton(
        onPressed: controller.changeDrawerMode, child: const Icon(Icons.menu));
  }

  Widget bodyPage() {
    return Expanded(
        child: Container(
            color: const Color.fromARGB(255, 243, 243, 243),
            child: controller.currentPage));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    return Scaffold(
        floatingActionButton: mainFloatingActionButton(),
        body: Row(children: [
          GetBuilder<MainPageController>(
              init: controller, builder: (ctx) => mainDrawer()),
          GetBuilder<MainPageController>(
              init: controller, builder: (ctx) => bodyPage())
        ]));
  }
}
