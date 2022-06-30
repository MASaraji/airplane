import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../config.dart';
import '../controller/main_page_controller.dart';

class HomePage extends GetView<MainPageController> {
  HomePage({Key? key}) : super(key: key);

  Widget drawerButton(
      {required String title,
      required IconData icon,
      required int pageNumber}) {
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
                    itemBuilder: (context, index) {
                      List item = controller.menuItems[index];
                      return drawerButton(
                          icon: item[1], pageNumber: item[2], title: item[0]);
                    },
                    itemCount: controller.menuItems.length)),
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
        body: Row(children: [
      GetBuilder(init: controller, builder: (ctx) => mainDrawer()),
      GetBuilder<MainPageController>(
          init: controller, builder: (ctx) => bodyPage())
    ]));
  }
}
