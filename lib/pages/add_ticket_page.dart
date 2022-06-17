import "package:flutter/material.dart";

class AddTicketPage extends StatelessWidget {
  Widget flightsDropDown() {
    return DropdownButton(items: [], onChanged: null);
  }

  Widget flightInfoPriceBox() {
    return TextField(
      readOnly: true,
      decoration:
          InputDecoration(border: OutlineInputBorder(), label: Text("Price")),
    );
  }

  Widget flightInfoDepartTimeeBox() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Depart Time")),
    );
  }

  Widget flightInfoArrivalTimeBox() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Arrival Time")),
    );
  }

  Widget flightInfoAirplaneBox() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Airplane")),
    );
  }

  Widget flightInfoOriginCityBox() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Origin City")),
    );
  }

  Widget flightInfoDestinationCityBox() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Destination City")),
    );
  }

  Widget flightInfoCapBox() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Capacity")),
    );
  }

  Widget flightInfoSoldedTicketsBox() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Solded Ticket")),
    );
  }

  Widget flightInfo() {
    //price - departtime-arrival time -airplane-origin city -destination-cap - solded ticket-
    return Expanded(
        flex: 2,
        child: Column(
          children: [
            Text("Flight Information"),
            flightsDropDown(),
            flightInfoPriceBox(),
            flightInfoDepartTimeeBox(),
            flightInfoArrivalTimeBox(),
            flightInfoAirplaneBox(),
            flightInfoOriginCityBox(),
            flightInfoDestinationCityBox(),
            flightInfoCapBox(),
            flightInfoSoldedTicketsBox()
          ],
        ));
  }

  Widget passengerFirstNameInput() {
    return TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), label: Text("FirstName")));
  }

  Widget passengerLastNameInput() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("Last Name")),
    );
  }

  Widget passengerPhoneInput() {
    return TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), label: Text("Phone")));
  }

  Widget passengerNCodeInput() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("National Code")),
    );
  }

  Widget passengerInfo() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Text("Passenger Information:"),
          Expanded(child: passengerFirstNameInput()),
          Expanded(child: passengerLastNameInput()),
          Row(
            children: [
              Expanded(child: passengerNCodeInput()),
              Expanded(child: passengerPhoneInput())
            ],
          )
        ],
      ),
    );
  }

  Widget reserveButton() {
    return ElevatedButton(onPressed: () {}, child: Text("Reserve"));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [flightInfo(), passengerInfo(), reserveButton()],
      ),
    );
  }
}
