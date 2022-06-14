import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  final List<Widget> buttons;
  final Widget endButton;
  const Toolbar({Key? key, required this.buttons, required this.endButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: buttons),
      endButton,
    ]);
  }
}
