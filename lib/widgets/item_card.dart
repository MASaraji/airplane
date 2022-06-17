import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  VoidCallback? onTap;
  ItemCard({Key? key, this.title = "", this.subtitle = "", this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      clipBehavior: Clip.hardEdge,
      shadowColor: Colors.lightBlueAccent[400],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.blue.withOpacity(.5), width: 2)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        subtitle: Text(subtitle),
        title: Text(title,
            style: const TextStyle(color: Colors.blue, fontSize: 23)),
        onTap: onTap ?? () {},
      ),
    );
  }
}
