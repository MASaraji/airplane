import 'package:flutter/material.dart';

import '../config.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final String trailing;
  const ItemCard(
      {Key? key,
      this.title = "",
      this.subtitle = "",
      this.onTap,
      this.trailing = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Config.itemCardSurfaceTint,
      elevation: 10,
      //clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black.withOpacity(.4), width: 2)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        trailing: Text(trailing),
        subtitle: Text(subtitle),
        title: Text(title, style: const TextStyle(fontSize: 23)),
        onTap: onTap ?? () {},
      ),
    );
  }
}
