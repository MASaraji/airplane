import "package:flutter/material.dart";

import '../models.dart';

class FlightInformationPage extends StatelessWidget {
  final Flight flight;
  const FlightInformationPage({Key? key, required this.flight})
      : super(key: key);

  Widget flightInformationPriceBox() {
    return TextField(
        controller: TextEditingController(text: flight.price.toString()),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Price")));
  }

  Widget flightInformationDepartTimeBox() {
    return TextField(
        controller:
            TextEditingController(text: flight.departureTime.toString()),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Depart Time")));
  }

  Widget flightInformationLandingTimeBox() {
    return TextField(
        controller: TextEditingController(text: flight.landingTime.toString()),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Landing Time")));
  }

  Widget flightInformationAirplaneBox() {
    return TextField(
        controller: TextEditingController(text: flight.airplane?.name),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Airplane")));
  }

  Widget flightInformationOriginCityBox() {
    return TextField(
        controller: TextEditingController(text: flight.originCity?.name),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Origin City")));
  }

  Widget flightInformationDestinationCityBox() {
    return TextField(
        controller: TextEditingController(text: flight.destinationCity?.name),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Destination City")));
  }

  Widget flightInformationBox() {
    return Column(
      children: [
        flightInformationPriceBox(),
        flightInformationDepartTimeBox(),
        flightInformationLandingTimeBox(),
        flightInformationAirplaneBox(),
        flightInformationOriginCityBox(),
        flightInformationDestinationCityBox()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      flightInformationBox(),
    ]);
  }
}
