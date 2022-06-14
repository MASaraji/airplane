import "package:flutter/material.dart";

class AddFlightPage extends StatelessWidget {
  const AddFlightPage({Key? key}) : super(key: key);

  AppBar appbar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Add Flight"),
    );
  }

  Widget addButton() {
    return ElevatedButton(
        onPressed: () {},
        child: const Text("Add", style: TextStyle(fontSize: 20)));
  }

  Widget priceInput() {
    return TextFormField(
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Price"));
  }

  Widget cityNameInput() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      // controller: nameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Can't be empty";
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Name",
        hintText: "Enter Name",
      ),
    );
  }

  Widget departTimeInput(BuildContext ctx) {
    return ElevatedButton(
      onPressed: () {
        showTimePicker(context: ctx, initialTime: TimeOfDay.now());
      },
      child: const Text("Depart Time"),
    );
  }

  Widget arrivalTimeInput(BuildContext ctx) {
    return ElevatedButton(
      child: const Text("Arrival Time"),
      onPressed: () {
        showTimePicker(context: ctx, initialTime: TimeOfDay.now());
      },
    );
  }

  Widget airplaneDropBox() {
    return DropdownButton(items: const [], onChanged: null);
  }

  Widget originCityDropBox() {
    return DropdownButton(items: const [], onChanged: null);
  }

  Widget destinationCityDropBox() {
    return DropdownButton(items: const [], onChanged: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(),
        body: Stack(children: [
          //background(),
          Column(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Column(children: [
                    priceInput(),
                    departTimeInput(context),
                    arrivalTimeInput(context),
                    airplaneDropBox(),
                    originCityDropBox(),
                    destinationCityDropBox()
                  ])),
              SizedBox(width: 150, height: 50, child: addButton()),
            ],
          )
        ]));
  }
}
