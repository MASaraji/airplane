import 'package:airplane/controller/add_ticket_page_controller.dart';
import 'package:airplane/widgets/snackbar.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/flights_controller.dart';
import '../models.dart';
import '../widgets/texts.dart';

class AddTicketPage extends GetView<AddTicketPageController> {
  const AddTicketPage({Key? key}) : super(key: key);

  Widget flightsDropDown() {
    List flights = FlightsController.getFlights();

    return DropdownButton(
        value: controller.flight,
        hint: const Text("Flights"),
        autofocus: true,
        items: flights
            .map((flight) =>
                DropdownMenuItem(value: flight, child: Text(flight.flightName)))
            .toList(),
        onChanged: (value) => controller.setFlight(value as Flight));
  }

  Widget flightInfoPriceBox() {
    return TextField(
      controller: TextEditingController(text: controller.price?.toString()),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Price")),
    );
  }

  Widget flightInfoDepartTimeBox(BuildContext ctx) {
    return TextField(
      controller:
          TextEditingController(text: controller.departTime?.format(ctx)),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Depart Time")),
    );
  }

  Widget flightInfoArrivalTimeBox(BuildContext ctx) {
    return TextField(
      controller:
          TextEditingController(text: controller.arrivalTime?.format(ctx)),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Arrival Time")),
    );
  }

  Widget flightInfoAirplaneBox() {
    return TextField(
      controller: TextEditingController(text: controller.airplane?.name),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Airplane")),
    );
  }

  Widget flightInfoOriginCityBox() {
    return TextField(
      controller: TextEditingController(text: controller.originCity?.name),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Origin City")),
    );
  }

  Widget flightInfoDestinationCityBox() {
    return TextField(
      controller: TextEditingController(text: controller.destinationCity?.name),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Destination City")),
    );
  }

  Widget flightInfoCapBox() {
    return TextField(
      controller: TextEditingController(text: controller.cap?.toString()),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Capacity")),
    );
  }

  Widget flightInfoSoldedTicketsBox() {
    return TextField(
      controller:
          TextEditingController(text: controller.soldedTicket?.toString()),
      readOnly: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Solded Ticket")),
    );
  }

  Widget flightInfo(BuildContext ctx) {
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
                    Expanded(flex: 19, child: flightInfoDepartTimeBox(ctx)),
                    const Spacer(),
                    Expanded(flex: 19, child: flightInfoArrivalTimeBox(ctx)),
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
        controller: TextEditingController(text: controller.firstName),
        textInputAction: TextInputAction.next,
        onChanged: (value) => controller.firstName = value,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("FirstName")));
  }

  Widget passengerLastNameInput() {
    return TextFormField(
      controller: TextEditingController(text: controller.lastName),
      textInputAction: TextInputAction.next,
      onChanged: (value) => controller.lastName = value,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Last Name")),
    );
  }

  Widget passengerPhoneInput() {
    return TextFormField(
        controller: TextEditingController(text: controller.phone?.toString()),
        textInputAction: TextInputAction.next,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => controller.phone = int.parse(value),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Phone")));
  }

  Widget passengerNCodeInput() {
    return TextFormField(
      controller: TextEditingController(text: controller.nationalCode),
      textInputAction: TextInputAction.next,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) => controller.nationalCode = value,
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
        child: ElevatedButton(
            onPressed: () {
              controller.addPassenger();
              Snackbar.snackbarSuccess("Ticket added successfully.");
            },
            child: const Text("Reserve")));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddTicketPageController());
    return Expanded(
      child: Column(
        children: [
          GetBuilder<AddTicketPageController>(
              init: controller, builder: (ctx) => flightInfo(context)),
          const SizedBox(height: 20),
          passengerInfo(),
          reserveButton(),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
