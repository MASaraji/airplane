import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";

import '../models.dart';
import '../widgets/item_card.dart';

class AirplaneInfoPage extends StatelessWidget {
  final Airplane airplane;
  const AirplaneInfoPage({Key? key, required this.airplane}) : super(key: key);

  Widget itemsList() {
    return Expanded(
      flex: 1,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.blue.withOpacity(.5), width: 2)),
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          primary: false,
          itemCount: 5,
          itemBuilder: (ctx, int index) {
            return const ItemCard(
              title: "hello",
              subtitle: "hello",
            );
          },
        ),
      ),
    );
  }

  Widget airplaneNameBox() {
    return TextField(
        controller: TextEditingController(text: airplane.name),
        readOnly: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Name")));
  }

  Widget airplaneModelBox() {
    return TextField(
        controller: TextEditingController(text: airplane.model),
        readOnly: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Model")));
  }

  Widget airplaneCapacityBox() {
    return TextField(
        controller: TextEditingController(text: airplane.capacity.toString()),
        readOnly: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Capacity")));
  }

  Widget airplaneInfo() {
    return Column(
      children: [
        Expanded(flex: 1, child: airplaneNameBox()),
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(flex: 5, child: airplaneModelBox()),
                const Spacer(flex: 1),
                Expanded(flex: 5, child: airplaneCapacityBox())
              ],
            ))
      ],
    );
  }

  Widget chart() {
    return LineChart(
      LineChartData(lineTouchData: LineTouchData(enabled: true), lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 1),
            const FlSpot(1, 2),
            const FlSpot(2, 3),
            const FlSpot(3, 2)
          ],
          isCurved: true,
        )
      ]),
      swapAnimationDuration: const Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(flex: 1, child: airplaneInfo()),
            const SizedBox(height: 20),
            Expanded(
              flex: 2,
              child: Row(children: [
                itemsList(),
                Expanded(
                    flex: 1, child: AspectRatio(aspectRatio: 2, child: chart()))
              ]),
            ),
          ],
        ));
  }
}
