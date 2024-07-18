import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_demo/core.dart';
import 'package:mvc_demo/module/dashboard/widget/dashboard_banner_image.dart';
import 'package:mvc_demo/shared/util/date_util/date_util.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  Widget build(context, DashboardController controller) {
    controller.view = this;
    var date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dahsboard"),
        backgroundColor: Colors.amber,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const DasboardBannerImage(),
              Text(
                DateFormat("d MMM y").format(date),
                selectionColor: Colors.amberAccent,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateUtil.todMMMy(date),
                selectionColor: Colors.cyan,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date.dMMMy,
                selectionColor: Colors.deepPurple,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
