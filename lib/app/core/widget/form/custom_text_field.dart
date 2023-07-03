import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';


class CustomTextField extends StatefulWidget {
  final String? label;
  final String formControlName;
  final Function? onChange;
  final String? type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField(
      {Key? key,
      this.label,
      required this.formControlName,
      this.onChange,
      this.prefixIcon,
      this.suffixIcon,
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
          obscureText: !_isPasswordVisible && widget.type == "password",
          name: widget.formControlName,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.type == "password" ? IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: _togglePasswordVisibility,
            ) : widget.suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: AppValues.smallPadding),
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
