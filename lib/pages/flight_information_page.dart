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
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black.withOpacity(.2), width: 2)),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          primary: false,
          itemCount: tickets.length,
          itemBuilder: (ctx, int index) {
            Ticket ticket = tickets[index];
            return ItemCard(
                title: ticket.passenger.name,
                subtitle: ticket.passenger.nationalCode);
          },
        ),
      ),
    );
  }

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
    return SizedBox(
      height: 700,
      width: 700,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Texts.pageTitle("Flight Information",
                  color: Colors.black, fontsize: 40)),
          Spacer(),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 5, child: flightInformationAirplaneBox()),
                  Spacer(),
                  Expanded(flex: 1, child: flightInformationPriceBox()),
                ],
              )),
          Spacer(),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 5, child: flightInformationDepartTimeBox()),
                  Spacer(),
                  Expanded(flex: 5, child: flightInformationLandingTimeBox()),
                ],
              )),
          Spacer(),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 5, child: flightInformationOriginCityBox()),
                  Spacer(),
                  Expanded(
                      flex: 5, child: flightInformationDestinationCityBox()),
                ],
              )),
          Spacer(),
          Expanded(flex: 12, child: itemsList())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return flightInformationBox();
  }
}
