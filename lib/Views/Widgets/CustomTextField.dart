import 'package:flutter/material.dart';

import '../../app/Globals.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final String? errorText;
  final bool? obscureText;
  final Function(String)? callback;
  final TextInputType? keyboardType;
  final double radius;

  CustomTextField(this.labelText,
      {required this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText,
      this.onSuffixIconTap,
      this.errorText,
      this.hintText,
      this.callback,
      this.keyboardType,
      required this.radius,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Globals.backgroundColor.withOpacity(0.75),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.15),
          //   offset: Offset(-1, 6),
          //   blurRadius: 2.0,
          // ),
        ],
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        cursorColor: Globals.primaryColor,
        style: TextStyle(color: Colors.black),
        obscureText: obscureText ?? false,
        onChanged: (value) {
          if (callback != null) callback!(value);
        },
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          // labelText: labelText ?? "",
          // labelStyle: TextStyle(color: Colors.white),
          hintText: labelText ?? "",
          hintStyle:
              TextStyle(color: Color(0xff8a8a8a), fontWeight: FontWeight.w400),

          contentPadding: EdgeInsets.fromLTRB(15, 11, 15, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide.none,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon != null
              ? InkWell(
                  onTap: onSuffixIconTap,
                  child: Icon(suffixIcon, color: Globals.primaryColor),
                )
              : null,
          errorText: errorText,
        ),
      ),
    );
  }
}
