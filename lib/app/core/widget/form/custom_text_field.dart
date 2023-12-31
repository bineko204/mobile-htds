import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';

import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String formControlName;
  final Function? onChange;
  final String? type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final int? maxLines;
  final List<String? Function(String?)>? validators;
  const CustomTextField(
      {Key? key,
      this.label,
      required this.formControlName,
      this.onChange,
      this.prefixIcon,
      this.suffixIcon,
      this.validators,
      this.hintText,
      this.maxLines = 1,
      this.type})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: AppValues.smallPadding),
                child: Text(
                  widget.label!,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            : Container(),
        FormBuilderTextField(
          maxLines: widget.maxLines,
          obscureText: !_isPasswordVisible && widget.type == "password",
          name: widget.formControlName,
          validator: FormBuilderValidators.compose(widget.validators ?? []),
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.type == "password" ? IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: _togglePasswordVisibility,
            ) : widget.suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: AppValues.smallPadding, vertical: AppValues.smallPadding),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(AppValues.smallElevation),
            ),
          ),
          onChanged: (val) {
            if (widget.onChange != null) {
              widget.onChange!(val);
            } else {
              print(val); // Print the text value write into TextField
            }
          },
        ),
      ],
    );
  }
}
