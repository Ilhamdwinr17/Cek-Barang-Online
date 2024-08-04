import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvc_demo/module/log_form_edit/log_form_edit_view.dart';

class LogFormEditController extends State<LogFormEditView> {
  late TextEditingController logIDController;
  late TextEditingController specificationPRController;
  late TextEditingController quantityController;
  late TextEditingController receivedByController;

  LogFormEditController();

  @override
  void initState() {
    super.initState();
    logIDController = TextEditingController();
    specificationPRController = TextEditingController();
    quantityController = TextEditingController();
    receivedByController = TextEditingController();

    if (widget.documentId != null) {
      _loadData();
    }
  }

  @override
  void dispose() {
    logIDController.dispose();
    specificationPRController.dispose();
    quantityController.dispose();
    receivedByController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final doc = await FirebaseFirestore.instance
        .collection('Log')
        .doc(widget.documentId)
        .get();
    final data = doc.data();
    if (data != null) {
      setState(() {
        logIDController.text = data['Log ID'] ?? '';
        specificationPRController.text = data['Specification PR'] ?? '';
        quantityController.text = data['Quantity']?.toString() ?? '';
        receivedByController.text = data['Received by'] ?? '';
      });
    }
  }

  Future<void> doSave() async {
    if (widget.documentId != null) {
      await FirebaseFirestore.instance
          .collection('Log')
          .doc(widget.documentId)
          .update({
        'Log ID': logIDController.text,
        'Specification PR': specificationPRController.text,
        'Quantity': int.tryParse(quantityController.text) ?? 0,
        'Received by': receivedByController.text,
      });
    } else {
      await FirebaseFirestore.instance.collection('Log').add({
        'Log ID': logIDController.text,
        'Specification PR': specificationPRController.text,
        'Quantity': int.tryParse(quantityController.text) ?? 0,
        'Received by': receivedByController.text,
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

//BATAS

/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvc_demo/module/log_form_edit/log_form_edit_view.dart';

class LogFormEditController extends State<LogFormEditView> {
  String? LogID;
  String? SpecificationPR;
  int? Quantity;
  String? NamaPenerima;

  LogFormEditController(); // Perubahan: Konstruktor kosong dihilangkan

  @override
  void initState() {
    super.initState();
    if (widget.documentId != null) {
      // Perubahan: Menggunakan widget.documentId
      _loadData();
    }
  }

  Future<void> _loadData() async {
    final doc = await FirebaseFirestore.instance
        .collection('Log')
        .doc(widget.documentId) // Perubahan: Menggunakan widget.documentId
        .get();
    final data = doc.data();
    if (data != null) {
      setState(() {
        LogID = data['Log ID'];
        SpecificationPR = data['Specification PR'];
        Quantity = data['Quantity'] is int
            ? data['Quantity']
            : int.tryParse(data['Quantity'].toString());
        NamaPenerima = data['Nama Penerima'];
      });
    }
  }

  Future<void> doSave() async {
    if (widget.documentId != null) {
      // Perubahan: Menggunakan widget.documentId
      await FirebaseFirestore.instance
          .collection('Log')
          .doc(widget.documentId) // Perubahan: Menggunakan widget.documentId
          .update({
        'Log ID': LogID,
        'Specification PR': SpecificationPR,
        'Quantity': Quantity,
        'Nama Penerima': NamaPenerima,
      });
    } else {
      await FirebaseFirestore.instance.collection('Log').add({
        'Log ID': LogID,
        'Specification PR': SpecificationPR,
        'Quantity': Quantity,
        'Nama Penerima': NamaPenerima,
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) =>
      widget.build(context, this); // Perubahan: Memperbarui build method
}*/

//BATASSS

/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvc_demo/module/log_form_edit/log_form_edit_view.dart';

class LogFormEditController extends State<LogFormEditView> {
  late TextEditingController logIDController;
  late TextEditingController specificationPRController;
  late TextEditingController quantityController;
  late TextEditingController namaPenerimaController;

  LogFormEditController();

  @override
  void initState() {
    super.initState();
    logIDController = TextEditingController();
    specificationPRController = TextEditingController();
    quantityController = TextEditingController();
    namaPenerimaController = TextEditingController();

    if (widget.documentId != null) {
      _loadData();
    }
  }

  @override
  void dispose() {
    logIDController.dispose();
    specificationPRController.dispose();
    quantityController.dispose();
    namaPenerimaController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final doc = await FirebaseFirestore.instance
        .collection('Log')
        .doc(widget.documentId)
        .get();
    final data = doc.data();
    if (data != null) {
      setState(() {
        logIDController.text = data['Log ID'] ?? '';
        specificationPRController.text = data['Specification PR'] ?? '';
        quantityController.text = data['Quantity']?.toString() ?? '';
        namaPenerimaController.text = data['Nama Penerima'] ?? '';
      });
    }
  }

  Future<void> doSave() async {
    if (widget.documentId != null) {
      await FirebaseFirestore.instance
          .collection('Log')
          .doc(widget.documentId)
          .update({
        'Log ID': logIDController.text,
        'Specification PR': specificationPRController.text,
        'Quantity': int.tryParse(quantityController.text) ?? 0,
        'Nama Penerima': namaPenerimaController.text,
      });
    } else {
      await FirebaseFirestore.instance.collection('Log').add({
        'Log ID': logIDController.text,
        'Specification PR': specificationPRController.text,
        'Quantity': int.tryParse(quantityController.text) ?? 0,
        'Nama Penerima': namaPenerimaController.text,
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}*/

//batass

/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvc_demo/module/log_form_edit/log_form_edit_view.dart';

class LogFormEditController extends State<LogFormEditView> {
  late TextEditingController logIDController;
  late TextEditingController specificationPRController;
  late TextEditingController quantityController;
  late TextEditingController namaPenerimaController;

  LogFormEditController();

  @override
  void initState() {
    super.initState();
    logIDController = TextEditingController();
    specificationPRController = TextEditingController();
    quantityController = TextEditingController();
    namaPenerimaController = TextEditingController();

    if (widget.documentId != null) {
      _loadData();
    }
  }

  @override
  void dispose() {
    logIDController.dispose();
    specificationPRController.dispose();
    quantityController.dispose();
    namaPenerimaController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('Log')
          .doc(widget.documentId)
          .get();
      final data = doc.data();
      if (data != null) {
        setState(() {
          logIDController.text = data['Log ID'] ?? '';
          specificationPRController.text = data['Specification PR'] ?? '';
          quantityController.text = data['Quantity']?.toString() ?? '';
          namaPenerimaController.text = data['Nama Penerima'] ?? '';
        });
      }
    } catch (e) {
      print("Error loading data: $e");
      // Handle error (e.g., show a snackbar or dialog)
    }
  }

  Future<void> doSave() async {
    try {
      if (widget.documentId != null) {
        await FirebaseFirestore.instance
            .collection('Log')
            .doc(widget.documentId)
            .update({
          'Log ID': logIDController.text,
          'Specification PR': specificationPRController.text,
          'Quantity': int.tryParse(quantityController.text) ?? 0,
          'Nama Penerima': namaPenerimaController.text,
        });
      } else {
        await FirebaseFirestore.instance.collection('Log').add({
          'Log ID': logIDController.text,
          'Specification PR': specificationPRController.text,
          'Quantity': int.tryParse(quantityController.text) ?? 0,
          'Nama Penerima': namaPenerimaController.text,
        });
      }
      Navigator.of(context).pop();
    } catch (e) {
      print("Error saving data: $e");
      // Handle error (e.g., show a snackbar or dialog)
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}*/
