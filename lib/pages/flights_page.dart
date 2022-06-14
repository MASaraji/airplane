import "package:flutter/material.dart";

class FlightsPage extends StatelessWidget {
  const FlightsPage({Key? key}) : super(key: key);
  Widget itemsList() {
    return Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.blue, width: 4)),
        height: 450,
        width: 750,
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (ctx, int index) {
            return Card(
                color: Colors.blue,
                child: ListTile(
                  title: const Text("hello",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {},
                ));
          },
        ));
  }

  Widget pageTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontFamily: "lato"),
    );
  }

  Widget searchButton() {
    return IconButton(
        splashRadius: 25,
        splashColor: Colors.blueAccent,
        onPressed: () {},
        icon: const Icon(Icons.search));
  }

  Widget changeTimeButton() {
    return ElevatedButton(onPressed: () {}, child: const Text("Change Time"));
  }

  Widget changeOrderButton() {
    return IconButton(
        splashRadius: 25,
        splashColor: Colors.blueAccent,
        onPressed: () {},
        icon: const Icon(Icons.sort, color: Colors.blue));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageTitle("Flights"),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 750,
            child: Row(children: [
              searchButton(),
              const SizedBox(width: 10),
              changeTimeButton(),
              const SizedBox(width: 540),
              changeOrderButton()
            ]),
          ),
          itemsList()
        ],
      ),
    );
  }
}
