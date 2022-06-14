import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Texts {
  static Widget pageTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
