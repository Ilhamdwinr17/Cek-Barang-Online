import 'package:flutter/material.dart';

class QTextField extends StatefulWidget {
  const QTextField({
    required this.label,
    required this.onChanged,
    super.key,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  });
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  TextEditingController textEditingController = TextEditingController();
  bool visible = false;

  @override
  void initState() {
    textEditingController.text = widget.value ?? '';
    super.initState();
  }

  String getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = '';
  }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(
      widget.suffixIcon ?? Icons.abc,
    );

    if (widget.obscure) {
      if (visible) {
        icon = InkWell(
          onTap: () {
            visible = false;
            setState(() {});
          },
          child: icon = const Icon(Icons.visibility),
        );
      } else {
        icon = InkWell(
          onTap: () {
            visible = true;
            setState(() {});
          },
          child: icon = const Icon(Icons.password),
        );
      }
    }

    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: TextFormField(
        enabled: widget.enabled,
        controller: textEditingController,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: widget.maxLength,
        obscureText: visible == false && widget.obscure,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: icon,
          helperText: widget.helper,
          hintText: widget.hint,
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}
