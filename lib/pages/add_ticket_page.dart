import "package:flutter/material.dart";

import '../widgets/texts.dart';

class AddTicketPage extends StatelessWidget {
  const AddTicketPage({Key? key}) : super(key: key);

  Widget flightsDropDown() {
    return DropdownButton(items: const [], onChanged: null);
  }

  Widget flightInfoPriceBox() {
    return const TextField(
      readOnly: true,
      decoration:
          InputDecoration(border: OutlineInputBorder(), label: Text("Price")),
    );
  }

  Widget flightInfoDepartTimeeBox() {
    return const TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Depart Time")),
    );
  }

  Widget flightInfoArrivalTimeBox() {
    return const TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Arrival Time")),
    );
  }

  Widget flightInfoAirplaneBox() {
    return const TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Airplane")),
    );
  }

  Widget flightInfoOriginCityBox() {
    return const TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Origin City")),
    );
  }

  Widget flightInfoDestinationCityBox() {
    return const TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Destination City")),
    );
  }

  Widget flightInfoCapBox() {
    return const TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Capacity")),
    );
  }

  Widget flightInfoSoldedTicketsBox() {
    return const TextField(
      readOnly: true,
      // ignore: unnecessary_const
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Solded Ticket")),
    );
  }

  Widget flightInfo() {
    //price - departtime-arrival time -airplane-origin city -destination-cap - solded ticket-
    return Expanded(
        flex: 2,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.black.withOpacity(.2), width: 2)),
          elevation: 10,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Texts.pageTitle("Flight Information",
                    color: Colors.black, fontsize: 30),
                flightsDropDown(),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(flex: 5, child: flightInfoAirplaneBox()),
                    const Spacer(flex: 1),
                    Expanded(flex: 2, child: flightInfoPriceBox()),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(flex: 19, child: flightInfoDepartTimeeBox()),
                    const Spacer(),
                    Expanded(flex: 19, child: flightInfoArrivalTimeBox()),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(flex: 12, child: flightInfoOriginCityBox()),
                    const Spacer(),
                    Expanded(flex: 12, child: flightInfoDestinationCityBox()),
                    const Spacer(),
                    Expanded(flex: 4, child: flightInfoCapBox()),
                    const Spacer(),
                    Expanded(flex: 4, child: flightInfoSoldedTicketsBox())
                  ],
                ))
              ],
            ),
          ),
        ));
  }

  Widget passengerFirstNameInput() {
    return TextFormField(
        decoration: const InputDecoration(
            // ignore: unnecessary_const
            border: const OutlineInputBorder(),
            label: Text("FirstName")));
  }

  Widget passengerLastNameInput() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Last Name")),
    );
  }

  Widget passengerPhoneInput() {
    return TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Phone")));
  }

  Widget passengerNCodeInput() {
    return TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("National Code")),
    );
  }

  Widget passengerInfo() {
    return Expanded(
      flex: 2,
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.black.withOpacity(.2), width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Texts.pageTitle("Passenger Information",
                  color: Colors.black, fontsize: 30),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 10, child: passengerFirstNameInput()),
                    const Spacer(),
                    Expanded(flex: 10, child: passengerLastNameInput()),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 10, child: passengerNCodeInput()),
                    const Spacer(),
                    Expanded(flex: 10, child: passengerPhoneInput())
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget reserveButton() {
    return SizedBox(
        height: 50,
        width: 150,
        child: ElevatedButton(onPressed: () {}, child: const Text("Reserve")));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          flightInfo(),
          const SizedBox(height: 20),
          passengerInfo(),
          reserveButton(),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
