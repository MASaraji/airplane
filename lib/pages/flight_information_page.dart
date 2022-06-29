import "package:flutter/material.dart";

import '../models.dart';
import '../widgets/item_card.dart';
import '../widgets/texts.dart';

class FlightInformationPage extends StatelessWidget {
  final Flight flight;

  const FlightInformationPage({Key? key, required this.flight})
      : super(key: key);

  Widget itemsList() {
    List tickets = flight.tickets;
    return Card(
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        primary: false,
        itemCount: tickets.length,
        itemBuilder: (ctx, int index) {
          Ticket ticket = tickets[index];
          return ItemCard(
              title: ticket.passenger.name,
              subtitle: ticket.passenger.nationalCode);
        },
      ),
    );
  }

  Widget flightInformationPriceBox() {
    return TextField(
        readOnly: true,
        controller: TextEditingController(text: flight.price.toString()),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Price")));
  }

  Widget flightInformationDepartTimeBox(BuildContext ctx) {
    return TextField(
        readOnly: true,
        controller:
            TextEditingController(text: flight.departureTime.format(ctx)),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Depart Time")));
  }

  Widget flightInformationLandingTimeBox(BuildContext ctx) {
    return TextField(
        readOnly: true,
        controller: TextEditingController(text: flight.landingTime.format(ctx)),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Landing Time")));
  }

  Widget flightInformationAirplaneBox() {
    return TextField(
        readOnly: true,
        controller: TextEditingController(text: flight.airplane?.name),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Airplane")));
  }

  Widget flightInformationOriginCityBox() {
    return TextField(
        readOnly: true,
        controller: TextEditingController(text: flight.originCity?.name),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Origin City")));
  }

  Widget flightInformationDestinationCityBox() {
    return TextField(
        readOnly: true,
        controller: TextEditingController(text: flight.destinationCity?.name),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Destination City")));
  }

  Widget flightInformationBox(BuildContext ctx) {
    return SizedBox(
      height: 700,
      width: 700,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Texts.pageTitle("Flight Information",
                  color: Colors.black, fontsize: 40)),
          const Spacer(),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 6, child: flightInformationAirplaneBox()),
                  const Spacer(),
                  Expanded(flex: 2, child: flightInformationPriceBox()),
                ],
              )),
          const Spacer(),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 5, child: flightInformationDepartTimeBox(ctx)),
                  const Spacer(),
                  Expanded(
                      flex: 5, child: flightInformationLandingTimeBox(ctx)),
                ],
              )),
          const Spacer(),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 5, child: flightInformationOriginCityBox()),
                  const Spacer(),
                  Expanded(
                      flex: 5, child: flightInformationDestinationCityBox()),
                ],
              )),
          const Spacer(),
          Expanded(flex: 12, child: itemsList())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return flightInformationBox(context);
  }
}
