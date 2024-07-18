import 'package:flutter/material.dart';
import 'package:mvc_demo/shared/widget/date/date.dart';
import 'package:mvc_demo/shared/widget/dropdown/dropdown.dart';
import '../controller/purchase_form_controller.dart';
import 'package:mvc_demo/core.dart';
//import 'package:get/get.dart';

class PurchaseFormView extends StatefulWidget {
  const PurchaseFormView({super.key});

  Widget build(context, PurchaseFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Form"),
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
                        label: "Tgl Terima Incoming",
                        //  validator: Validator.required,
                        value: DateTime.now(),
                        onChanged: (value) {
                          print("value: $value");
                        },
                      ),
                      QTextField(
                        label: "No Resi",
                        suffixIcon: Icons.qr_code,
                        //validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          controller.NoResi = value;
                        },
                      ),
                      QDropdownField(
                        label: "Status",

                        //validator: Validator.required,
                        items: const [
                          {
                            "label": "Datang",
                            "value": "Datang",
                          },
                          {
                            "label": "Belum",
                            "value": "Belum",
                          },
                          {
                            "label": "Sudah Diambil",
                            "value": "Sudah Diambil",
                          },
                        ],
                        //value: "Admin",
                        onChanged: (value, label) {
                          controller.Status = value;
                        },
                      ),
                      QDropdownField(
                        label: "Departement",

                        //validator: Validator.required,
                        items: const [
                          {
                            "label": "PPIC",
                            "value": "PPIC",
                          },
                          {
                            "label": "HR & GA",
                            "value": "HR & GA",
                          },
                          {
                            "label": "PRODUKSI",
                            "value": "Produksi",
                          },
                          {
                            "label": "QUALITY ASSURANCE",
                            "value": "QUALITY ASSURANCE",
                          },
                          {
                            "label": "MECHANICAL ENGINEERING",
                            "value": "MECHANICAL ENGINEERING",
                          },
                          {
                            "label": "PROCESS ENGINEERING",
                            "value": "PROCESS ENGINEERING",
                          },
                          {
                            "label": "NEW PRODUCT DEVELOPMENT",
                            "value": "NEW PRODUCT DEVELOPMENT",
                          },
                          {
                            "label": "RESEARCH AND DEVELOPMENT",
                            "value": "RESEARCH AND DEVELOPMENT",
                          },
                          {
                            "label": "MARKETING",
                            "value": "MARKETING",
                          },
                          {
                            "label": "FINANCE & ACCOUNTING",
                            "value": "FINANCE & ACCOUNTING",
                          },
                          {
                            "label": "WHSP",
                            "value": "WHSP",
                          },
                          {
                            "label": "PURCHASING",
                            "value": "PURCHASING",
                          },
                        ],
                        //value: "Admin",
                        onChanged: (value, label) {
                          controller.Departement = value;
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
  State<PurchaseFormView> createState() => PurchaseFormController();
}
