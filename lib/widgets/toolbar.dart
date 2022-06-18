import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  final List<Widget> buttons;
  final Widget endButton;
  const Toolbar({Key? key, required this.buttons, required this.endButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black.withOpacity(.2), width: 2)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: buttons),
        endButton,
      ]),
    );
  }
}
