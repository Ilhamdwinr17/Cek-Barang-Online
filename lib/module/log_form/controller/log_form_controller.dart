import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/module/log_form/view/log_form_view.dart';
import 'package:mvc_demo/state_util.dart';
//import 'package:get/get.dart';

class LogFormController extends State<LogFormView> {
  static late LogFormController Instance;
  late LogFormView view;

  @override
  void InitState() {
    Instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String? LogID;
  String? SpecificationPR;
  String? Quantity;
  String? NamaPenerima;

  doSave() async {
    //fire_add
    await FirebaseFirestore.instance.collection("Log").add({
      "Date": DateTime.now(),
      "Log ID": LogID,
      "Specification PR": SpecificationPR,
      "Quantity": Quantity,
      "Received by": NamaPenerima,
    });
    Get.back();
  }

  doUpdate() async {
    await FirebaseFirestore.instance.collection("Log").doc("id").update({
      "product_name": "ProductXXX",
      "price": 25,
    });
  }
}
