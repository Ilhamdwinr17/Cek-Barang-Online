import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../view/user_dashboard_view.dart';

class UserDashboardController extends State<UserDashboardView> {
  static late UserDashboardController instance;
  late UserDashboardView view;

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
