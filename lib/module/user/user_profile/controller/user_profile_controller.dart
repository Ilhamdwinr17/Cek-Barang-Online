import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../view/user_profile_view.dart';

class UserProfileController extends State<UserProfileView> {
  static late UserProfileController instance;
  late UserProfileView view;

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
