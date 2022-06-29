import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../config.dart';
import '../controller/main_page_controller.dart';

class HomePage extends GetView<MainPageController> {
  HomePage({Key? key}) : super(key: key);

  Widget drawerButton(String title, IconData icon, int pageNumber) {
    int selectedPage = controller.selectedPage;
    return ListTile(
      hoverColor: Colors.transparent,
      selected: pageNumber == selectedPage,
      selectedTileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      leading: Icon(icon),
      title: Text(title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
      textColor: Config.mainDrawerButtonColor,
      iconColor: Config.mainDrawerButtonColor,
      style: ListTileStyle.drawer,
      onTap: () => controller.changePage(pageNumber),
    );
  }

  Widget avatar() {
    return const CircleAvatar(
        radius: 70,
        backgroundColor: Config.mainDrawerButtonColor,
        child: Icon(
          Icons.face_unlock_rounded,
          color: Config.mainDrawerColor,
          size: 100,
        ));
  }

  final List menuItems = [
    ["Flights of day", Icons.today_rounded, 0],
    ["Flights", Icons.airlines_rounded, 1],
    ["Airplanes", Icons.airplanemode_active_rounded, 2],
    ["Cities", Icons.location_city_outlined, 3],
    ["Add Ticket", Icons.airplane_ticket_rounded, 4],
    ["", Icons.more_horiz_rounded, 5]
  ];

  Widget mainDrawer() {
    return Expanded(
      flex: 3,
      child: Card(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
        color: Config.mainDrawerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            avatar(),
            const SizedBox(height: 70),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: ((context, index) => drawerButton(
                      menuItems[index][0], //title
                      menuItems[index][1], //icon
                      menuItems[index][2])), //pageNumber
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
        flex: 9,
        child: Container(
            padding: const EdgeInsets.all(5), child: controller.currentPage));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    return Scaffold(
        //  floatingActionButton: mainFloatingActionButton(),
        body: Row(children: [
      GetBuilder(init: controller, builder: (ctx) => mainDrawer()),
      GetBuilder<MainPageController>(
          init: controller, builder: (ctx) => bodyPage())
    ]));
  }
}
