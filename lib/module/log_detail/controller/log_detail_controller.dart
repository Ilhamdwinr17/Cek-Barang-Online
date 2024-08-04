import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import 'package:mvc_demo/module/log_detail/view/log_detail_view.dart';

class LogDetailController extends State<LogDetailView> {
  static late LogDetailController instance;
  late LogDetailView view;
  late Future<DocumentSnapshot> itemData;

  @override
  void initState() {
    super.initState();
    instance = this;
    // Fetch the data based on the item ID provided
    itemData = FirebaseFirestore.instance
        .collection("Log")
        .doc(
            widget.item["id"]) // assuming 'id' is the key to fetch the document
        .get();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
