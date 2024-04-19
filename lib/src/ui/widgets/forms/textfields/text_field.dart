// ignore_for_file: sort_child_properties_last

import '../../../../utils/config/uidata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final bool togglePassword;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  CommonTextField(
      {required this.controller,
      this.validator,
      this.labelText,
      this.hintText,
      this.isTextHidden = false,
      this.buttonIcon,
      this.onChanged,
      this.togglePassword = false,
      this.toggleFunction,
      this.toggleIcon,
      this.keyboardType,
      this.readOnly = false,
      this.onTap,
      this.inputFormatters,
      this.focus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: isTextHidden,
      readOnly: readOnly,
      onTap: onTap,
      focusNode: focus,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        suffixIcon: togglePassword
            ? GestureDetector(child: Icon(toggleIcon), onTap: toggleFunction)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            // Radius.circular(6),
            Radius.circular(90),
          ),
          borderSide: BorderSide(
            color: UIDataColors.white,
          ),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
            color: UIDataColors.black.withOpacity(0.7),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            letterSpacing: 0.0),
        contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 18.0),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(80),
          ),
          borderSide: BorderSide(
            color: UIDataColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(
            color: UIDataColors.white,
          ),
        ),
      ),
      controller: controller,
      validator: validator,
    );
  }
}
