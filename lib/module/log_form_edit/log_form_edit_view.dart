import 'package:flutter/material.dart';
import 'package:mvc_demo/module/log_form_edit/log_form_edit_controller.dart';
import 'package:mvc_demo/shared/widget/date/date.dart';

class LogFormEditView extends StatefulWidget {
  final String? documentId;

  const LogFormEditView({super.key, this.documentId});

  @override
  LogFormEditController createState() => LogFormEditController();

  Widget build(BuildContext context, LogFormEditController controller) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Form Edit"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QDatePicker(
                        label: "Date",
                        value: DateTime.now(),
                        onChanged: (value) {
                          print("value: $value");
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Log ID",
                          suffixIcon: Icon(Icons.code),
                        ),
                        onChanged: (value) =>
                            controller.logIDController.text = value,
                        controller: controller.logIDController,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Specification PR",
                        ),
                        onChanged: (value) =>
                            controller.specificationPRController.text = value,
                        controller: controller.specificationPRController,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Quantity",
                        ),
                        onChanged: (value) =>
                            controller.quantityController.text = value,
                        controller: controller.quantityController,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Received by",
                        ),
                        onChanged: (value) =>
                            controller.receivedByController.text = value,
                        controller: controller.receivedByController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          onPressed: () => controller.doSave(),
          child: const Text("Save"),
        ),
      ),
    );
  }
}


//BATAS

/*import 'package:flutter/material.dart';
import 'package:mvc_demo/module/log_form_edit/log_form_edit_controller.dart';

import 'package:mvc_demo/shared/widget/date/date.dart';
import 'package:mvc_demo/shared/widget/number_field/number_field.dart';
import 'package:mvc_demo/shared/widget/textfield/textfield.dart';

class LogFormEditView extends StatefulWidget {
  final String? documentId; // Tambahkan documentId

  const LogFormEditView({super.key, this.documentId});

  @override
  LogFormEditController createState() => LogFormEditController();

  Widget build(BuildContext context, LogFormEditController controller) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Form Edit"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QDatePicker(
                        label: "Date",
                        value: DateTime.now(),
                        onChanged: (value) {
                          print("value: $value");
                        },
                      ),
                      QTextField(
                        label: "Log ID",
                        suffixIcon: Icons.code,
                        value: controller.LogID,
                        onChanged: (value) {
                          controller.LogID = value;
                        },
                      ),
                      QTextField(
                        label: "Specification PR",
                        value: controller.SpecificationPR,
                        onChanged: (value) {
                          controller.SpecificationPR = value;
                        },
                      ),
                      QNumberField(
                        label: "Quantity",
                        value: controller.Quantity?.toString(),
                        onChanged: (value) {
                          controller.Quantity = int.tryParse(value);
                        },
                      ),
                      QTextField(
                        label: "Nama Penerima",
                        value: controller.NamaPenerima,
                        onChanged: (value) {
                          controller.NamaPenerima = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          onPressed: () => controller.doSave(),
          child: const Text("Save"),
        ),
      ),
    );
  }
}*/

//BATASS

/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_demo/module/log_form_edit/log_form_edit_controller.dart';
import 'package:mvc_demo/shared/widget/date/date.dart';
import 'package:mvc_demo/shared/widget/number_field/number_field.dart';
import 'package:mvc_demo/shared/widget/textfield/textfield.dart';

class LogFormEditView extends StatefulWidget {
  final String? documentId;

  const LogFormEditView({super.key, this.documentId});

  @override
  LogFormEditController createState() => LogFormEditController();

  Widget build(BuildContext context, LogFormEditController controller) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Form Edit"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QDatePicker(
                        label: "Date",
                        value: DateTime.now(),
                        onChanged: (value) {
                          print("value: $value");
                        },
                      ),
                      QTextField(
                        label: "Log ID",
                        suffixIcon: Icons.code,
                        value: controller.logIDController.text,
                        onChanged: (value) {
                          controller.logIDController;
                        },
                      ),
                      QTextField(
                        label: "Specification PR",
                        value: controller.specificationPRController.text,
                        onChanged: (value) {
                          controller.specificationPRController;
                        },
                      ),
                      QNumberField(
                        label: "Quantity",
                        value: controller.quantityController.text,
                        onChanged: (value) {
                          controller.quantityController;
                        },
                      ),
                      QTextField(
                        label: "Nama Penerima",
                        value: controller.namaPenerimaController.text,
                        onChanged: (value) {
                          controller.namaPenerimaController;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
          ),
          onPressed: () => controller.doSave(),
          child: const Text("Save"),
        ),
      ),
    );
  }
}*/
