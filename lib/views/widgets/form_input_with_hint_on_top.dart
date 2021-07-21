import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInputWithHint extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Key? key;
  final TextEditingController controller;
  final String? errorText;
  final Function? onChanged;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? hintText;
  final int maxLine;
  final bool isEnabled;
  final Color borderColor;
  final TextInputAction textInputAction;
  final double textFieldHeight;
  final Color fillColor;
  final Function? onSubmitted;

  FormInputWithHint({
    required this.label,
    this.obscureText = false,

    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction = TextInputAction.go,
    this.borderColor = Colors.transparent,
    required this.controller,
    this.fillColor = Colors.red,
    this.key,
    this.onSubmitted,
    this.isEnabled = true,
    this.maxLine = 1,
    this.errorText,
    this.onChanged,
    @required this.focusNode,
    this.initialValue,
    this.hintText,
    this.textFieldHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      enabled: isEnabled,
      controller: controller,

      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              width: 0, style: BorderStyle.none),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: textFieldHeight,
          horizontal: 10,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorText: errorText,
        errorMaxLines: 3,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16, letterSpacing: 0.7,color: Colors.white),
      ),
      style: TextStyle(fontSize: 16, letterSpacing: 0.7,color: Colors.white),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onFieldSubmitted: (value) {
        onSubmitted!();
      },

      maxLines: maxLine,
      key: key,
      //onChanged: onChanged,
      initialValue: initialValue,
      textInputAction: textInputAction,
    );
  }
}
