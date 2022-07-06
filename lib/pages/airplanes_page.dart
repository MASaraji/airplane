import 'package:airplane/pages/airplane_info_page.dart';
import 'package:airplane/widgets/texts.dart';
import 'package:airplane/widgets/toolbar.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../controller/airplanes_page_controller.dart';
import '../models.dart';
import '../widgets/item_card.dart';

class AirplanesPage extends GetView<AirplanesPageController> {
  const AirplanesPage({Key? key}) : super(key: key);

  Widget itemsList() {
    List airplanes = controller.airplanes;
    return Expanded(
      child: Card(
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          primary: false,
          itemCount: airplanes.length,
          itemBuilder: (ctx, int index) {
            Airplane airplane = airplanes[index];
            return ItemCard(
                title: airplane.name,
                subtitle: airplane.model,
                onTap: () => Get.dialog(airplaneInformationDialog(airplane)));
          },
        ),
      ),
    );
  }

  Widget airplaneInformationDialog(Airplane airplane) {
    return Dialog(
        child: Container(
            padding: const EdgeInsets.all(20),
            height: 600,
            width: 1200,
            child: AirplaneInfoPage(
              airplane: airplane,
            )));
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
                  onChanged: (value) => controller.changeSort(1)),
              title: const Text("Ascending")),
          ListTile(
              leading: Radio(
                  value: 2,
                  groupValue: controller.sort.value,
                  onChanged: (value) => controller.changeSort(2)),
              title: const Text("Descending"))
        ]),
      ),
    );
  }

  Widget addAirplaneButton() {
    return IconButton(
      splashRadius: 25,
      onPressed: () => Get.toNamed("/addAirplanePage")
          ?.then((value) => controller.getAirplanes()),
      tooltip: "Add Airplane",
      icon: const Icon(Icons.add),
    );
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25,
        onPressed: () => Get.dialog(changeOrderDialog()),
        icon: const Icon(Icons.sort));
  }

  Widget backgroundImage() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.black.withOpacity(.2), width: 2),
      ),
      elevation: 10,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Image.asset("assets/gifs/airplane.gif", fit: BoxFit.fill)),
    );
  }

  Widget toolbarMenu() {
    return Toolbar(
        buttons: [addAirplaneButton()], endButton: changeOrderButton());
  }

  Widget decorationPage() {
    return Expanded(
        child: Stack(fit: StackFit.expand, children: [
      Positioned.fill(child: backgroundImage()),
      Positioned(
        left: 10,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Texts.pageTitle("Airplanes"),
          Texts.timeText(),
        ]),
      )
    ]));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AirplanesPageController());
    return Column(children: [
      decorationPage(),
      toolbarMenu(),
      Obx(itemsList),
    ]);
  }
}
