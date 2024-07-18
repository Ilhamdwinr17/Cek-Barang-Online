import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../controller/pos_controller.dart';

class PosView extends StatefulWidget {
  const PosView({Key? key}) : super(key: key);

  Widget build(context, PosController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pos"),
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
  State<PosView> createState() => PosController();
}
