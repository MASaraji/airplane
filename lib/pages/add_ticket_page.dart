import 'package:airplane/controller/add_ticket_page_controller.dart';
import 'package:airplane/widgets/snackbar.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/flights_controller.dart';
import '../models.dart';
import '../widgets/texts.dart';

class AddTicketPage extends GetView<AddTicketPageController> {
  AddTicketPage({Key? key}) : super(key: key);

  Widget totalPrice(Discount discount) {
    return TextField(
        readOnly: true,
        controller: TextEditingController(text: discount.total.toString()),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("total")));
  }

  var percent = 0.0.obs;
  Widget percentSlider(Discount discount) {
    percent.value = discount.percent;
    return Slider(
        label: percent.toString(),
        onChanged: (value) {
          discount.percent = value;
          percent.value = value;
        },
        min: 0.0,
        divisions: 100,
        max: 100.0,
        value: percent.value);
  }

  Widget discountDialog(Passenger passenger) {
    return Dialog(
        child: Container(
            padding: const EdgeInsets.all(20),
            height: 300,
            width: 600,
            child: Column(
              children: [
                totalPrice(passenger.discount),
                Obx(() => percentSlider(passenger.discount)),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.addTicket();
                        Snackbar.snackbarSuccess("Ticket added successfully.");
                        Get.offAndToNamed("/mainPage");
                      },
                      child: const Text("add")),
                )
              ],
            )));
  }

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
        flex: 5,
        child: Card(
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Can't be empty";
          }
          return null;
        },
        controller: TextEditingController(text: controller.firstName),
        textInputAction: TextInputAction.next,
        onChanged: (value) => controller.firstName = value,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("FirstName")));
  }

  Widget passengerLastNameInput() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Can't be empty";
        }
        return null;
      },
      controller: TextEditingController(text: controller.lastName),
      textInputAction: TextInputAction.next,
      onChanged: (value) => controller.lastName = value,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("Last Name")),
    );
  }

  Widget passengerPhoneInput() {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Can't be empty";
          }
          return null;
        },
        controller: TextEditingController(text: controller.phone?.toString()),
        textInputAction: TextInputAction.next,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => controller.phone =
            value == "" ? controller.phone : int.parse(value),
        decoration: const InputDecoration(
            border: OutlineInputBorder(), label: Text("Phone")));
  }

  Widget passengerNCodeInput() {
    return TextFormField(
      controller: TextEditingController(text: controller.nationalCode),
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Can't be empty";
        }
        return null;
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (value) => controller.nationalCode = value,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), label: Text("National Code")),
    );
  }

  Widget passengerInfo() {
    return Expanded(
      flex: 4,
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
              if (controller.flight == null) {
                Snackbar.snackbarError("Please choose a flight.");
              } else if (controller.firstName == null) {
                Snackbar.snackbarError("First Name is empty.");
              } else if (controller.lastName == null) {
                Snackbar.snackbarError("Last Name is empty");
              } else if (controller.nationalCode == null) {
                Snackbar.snackbarError("National code is empty.");
              } else if (controller.phone == null) {
                Snackbar.snackbarError("Phone is emptry");
              } else {
                String? message = controller.addPassenger();
                if (message != null) {
                  Snackbar.snackbarError(message);
                }
                Get.dialog(
                  discountDialog(controller.passenger as Passenger),
                );
                // Snackbar.snackbarSuccess("Ticket added successfully.");
              }
            },
            child: const Text("Reserve")));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddTicketPageController());
    return Column(
      children: [
        GetBuilder<AddTicketPageController>(
            init: controller, builder: (ctx) => flightInfo(context)),
        const SizedBox(height: 20),
        GetBuilder<AddTicketPageController>(
            init: controller, builder: (ctx) => passengerInfo()),
        reserveButton(),
        const SizedBox(height: 40)
      ],
    );
  }
}
