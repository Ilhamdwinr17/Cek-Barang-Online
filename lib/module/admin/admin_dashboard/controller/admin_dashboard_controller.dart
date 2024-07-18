import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../view/admin_dashboard_view.dart';

class AdminDashboardController extends State<AdminDashboardView> {
  static late AdminDashboardController instance;
  late AdminDashboardView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
