import 'package:flutter/material.dart';
import 'package:scci_app/constants/appColors.dart';

class MyTextField extends StatelessWidget {
  final containerWidth;
  final hintText;
  final labelText;
  final maxLines;
  final controller;
  final validator;
  final focusNode;
  final onchange;
  final enable;
  final textKeyboardType;
  final prefixIcon;
  final sufixIcon;
  final bool obscurText;
  final String? dateMask;
  MyTextField({
    Key? key,
    this.containerWidth,
    @required this.hintText,
    this.labelText,
    this.textKeyboardType,
    this.focusNode,
    this.onchange,
    this.maxLines,
    this.enable,
    this.prefixIcon,
    this.sufixIcon,
    this.obscurText = false,
    @required this.controller,
    this.validator,
    this.dateMask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final dateMaskFormatter = MaskTextInputFormatter(mask: dateMask);
    return TextFormField(
      controller: controller,
      keyboardType: textKeyboardType,
      style: TextStyle(color: Colors.white),
      obscureText: obscurText,
      decoration: InputDecoration(
          fillColor: AppColors.black.withOpacity(0.4),
          filled: true,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: TextStyle(color: Colors.white, fontSize: 18),
          suffixIcon: sufixIcon,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.red, width: 2.0
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: AppColors.golden, width: 2.0
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        )
      ),
      validator: validator,
    );
  }
}