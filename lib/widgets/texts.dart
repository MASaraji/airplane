import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Texts {
  static Widget pageTitle(String title,
      {double fontsize = 70, Color color = Colors.white}) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight: FontWeight.bold,
          color: color,
          fontFamily: "lato"),
    );
  }

  static Widget timeText() {
    return Text(
      DateFormat(" EEEE, MM, yyyy").format(DateTime.now()),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
