import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import 'package:mvc_demo/shared/widget/search/search_purchase_list_view.dart';
import '../view/order_view.dart';

class OrderController extends State<OrderView> {
  static late OrderController instance;
  late OrderView view;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  /* void startSearch() {
    Get.to(const SearchPurchaseListView());
  }*/

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchController.clear();
      searchQuery = "";
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  List<QueryDocumentSnapshot> filterData(List<QueryDocumentSnapshot> docs) {
    if (searchQuery.isEmpty) {
      return docs;
    }
    return docs.where((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String logID = data["Log ID"] ?? '';
      String spesificationPR = data["Specification PR"] ?? '';
      String receivedBY = data["Received by"] ?? '';
      return logID.toLowerCase().contains(searchQuery.toLowerCase()) ||
          spesificationPR.toLowerCase().contains(searchQuery.toLowerCase()) ||
          receivedBY.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  /*updateStatus(Map<String, dynamic> item) async {
    //fire_update
    var status = item["Status"];
    if (status == "Belum") {
      status = "Datang";
    } else if (status == "Datang") {
      status = "Sudah Diambil";
    }
    await FirebaseFirestore.instance
        .collection("purchase")
        .doc(item["id"])
        .update({
      "Status": status,
    });
  }*/

  delete(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance.collection("Log").doc(item["id"]).delete();
  }

  doBack() {
    Get.to((const OrderView()));
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DashboardView()));
  }
}
