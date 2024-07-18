import 'package:flutter/material.dart';
import 'package:mvc_demo/core.dart';
import '../view/pos_checkout_view.dart';

class PosCheckoutController extends State<PosCheckoutView> {
  static late PosCheckoutController instance;
  late PosCheckoutView view;

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
