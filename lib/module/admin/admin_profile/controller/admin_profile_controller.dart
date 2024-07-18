import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../view/admin_profile_view.dart';

class AdminProfileController extends State<AdminProfileView> {
  static late AdminProfileController instance;
  late AdminProfileView view;

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
