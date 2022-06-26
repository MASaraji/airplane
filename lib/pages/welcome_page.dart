import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Widget startIcon() {
    return const Icon(
      Icons.airplane_ticket_rounded,
      color: Colors.white,
      size: 500,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () => Get.offNamed("/mainPage"));

    return Scaffold(
        body: Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        startIcon(),
        const SpinKitThreeBounce(color: Colors.white)
      ]),
    ));
  }
}
