import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../controller/pos_checkout_controller.dart';

class PosCheckoutView extends StatefulWidget {
  const PosCheckoutView({Key? key}) : super(key: key);

  Widget build(context, PosCheckoutController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("PosCheckout"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<PosCheckoutView> createState() => PosCheckoutController();
}
