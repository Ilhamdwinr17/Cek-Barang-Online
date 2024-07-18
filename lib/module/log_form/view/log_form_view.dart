import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/shared/widget/date/date.dart';
import 'package:mvc_demo/shared/widget/dropdown/dropdown.dart';

import 'package:mvc_demo/core.dart';
import 'package:mvc_demo/shared/widget/number_field/number_field.dart';
//import 'package:get/get.dart';

class LogFormView extends StatefulWidget {
  const LogFormView({super.key});

  Widget build(context, LogFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Form"),
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
                        //  validator: Validator.required,
                        value: DateTime.now(),
                        onChanged: (value) {
                          print("value: $value");
                        },
                      ),
                      QTextField(
                        label: "Log ID",
                        suffixIcon: Icons.code,
                        //validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          controller.LogID = value;
                        },
                      ),
                      QTextField(
                        label: "Specification PR",
                        //validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          controller.SpecificationPR = value;
                        },
                      ),
                      QNumberField(
                        label: "Quantity",
                        //validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          controller.Quantity = value;
                        },
                      ),
                      QTextField(
                        label: "Nama Penerima",
                        // validator: Validator.required,
                        value: null,
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

  @override
  State<LogFormView> createState() => LogFormController();
}
