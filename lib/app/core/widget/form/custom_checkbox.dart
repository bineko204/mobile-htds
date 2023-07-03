import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class CustomCheckbox extends StatelessWidget {
  final String? label;
  final String formControlName;
  final Function? onChange;

  const CustomCheckbox(
      {Key? key,
      this.label,
      required this.formControlName,
      this.onChange,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: formControlName,
      checkColor: Colors.white,
      activeColor: Colors.black,
      // contentPadding: EdgeInsets.zero,
      title: Text(
        label!,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
