import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";

import '../models.dart';
import '../widgets/item_card.dart';

class AirplaneInfoPage extends StatelessWidget {
  final Airplane airplane;
  const AirplaneInfoPage({Key? key, required this.airplane}) : super(key: key);

  Widget itemsList() {
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
            itemCount: 5,
            itemBuilder: (ctx, int index) {
              return ItemCard(
                title: "hello",
                subtitle: "hello",
              );
            },
          ),
        ),
      ),
    );
  }

  Widget airplaneNameBox() {
    return TextField(
        controller: TextEditingController(text: airplane.name),
        readOnly: true,
        decoration:
            InputDecoration(border: OutlineInputBorder(), label: Text("Name")));
  }

  Widget airplaneModelBox() {
    return TextField(
        controller: TextEditingController(text: airplane.model),
        readOnly: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(), label: Text("Model")));
  }

  Widget airplaneCapacityBox() {
    return TextField(
        controller: TextEditingController(text: airplane.capacity.toString()),
        readOnly: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(), label: Text("Capacity")));
  }

  Widget airplaneInfo() {
    return Column(
      children: [airplaneNameBox(), airplaneModelBox(), airplaneCapacityBox()],
    );
  }

  Widget chart() {
    return LineChart(
      LineChartData(lineTouchData: LineTouchData(enabled: true), lineBarsData: [
        LineChartBarData(
          spots: [FlSpot(0, 1), FlSpot(1, 2), FlSpot(2, 3), FlSpot(3, 2)],
          isCurved: true,
        )
      ]),
      swapAnimationDuration: Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            airplaneInfo(),
            Expanded(
              child: Row(children: [
                itemsList(),
                Expanded(child: AspectRatio(aspectRatio: 2, child: chart()))
              ]),
            ),
          ],
        ));
  }
}
