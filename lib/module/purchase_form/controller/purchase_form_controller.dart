import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/state_util.dart';
//import 'package:get/get.dart';

import '../view/purchase_form_view.dart';

class PurchaseFormController extends State<PurchaseFormView> {
  static late PurchaseFormController Instance;
  late PurchaseFormView view;

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
  String? NoResi;
  String? Status;
  String? Departement;

  doSave() async {
    //fire_add
    await FirebaseFirestore.instance.collection("purchase").add({
      "NoResi": NoResi,
      "Status": Status,
      "Departement": Departement,
      "created_at": DateTime.now(),
      "user": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "email": FirebaseAuth.instance.currentUser!.email,
      }
    });
    Get.back();
  }
}
