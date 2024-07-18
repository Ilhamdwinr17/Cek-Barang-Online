import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:mvc_demo/core.dart';
import 'package:mvc_demo/module/dashboard/view/dashboard_view.dart';
import 'package:mvc_demo/module/login/view/login_view.dart';
import 'package:mvc_demo/module/user/user_dashboard/view/user_dashboard_view.dart';
import 'package:mvc_demo/shared/widget/search/search_purchase_list_view.dart';
//import 'package:get/get.dart';
import 'package:mvc_demo/state_util.dart';

class SearchPurchaseListController extends State<SearchPurchaseListView> {
  static late SearchPurchaseListController Instance;
  late SearchPurchaseListView view;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  void initState() {
    Instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

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
      String noResi = data["NoResi"] ?? '';
      String departement = data["Departement"] ?? '';
      String status = data["Status"] ?? '';
      return noResi.toLowerCase().contains(searchQuery.toLowerCase()) ||
          departement.toLowerCase().contains(searchQuery.toLowerCase()) ||
          status.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  updateStatus(Map<String, dynamic> item) async {
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
  }

  delete(Map<String, dynamic> item) async {
    await FirebaseFirestore.instance
        .collection("purchase")
        .doc(item["id"])
        .delete();
  }

  doBack() {
    Get.to(const DashboardView());
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DashboardView()));
  }
}
