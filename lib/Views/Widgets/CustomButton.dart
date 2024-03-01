import 'package:flutter/material.dart';

import '../../app/Globals.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Widget? icon;
  final bool isLoading;

  CustomButton({
    required this.buttonText,
    this.buttonTextColor,
    this.buttonColor,
    this.margin,
    required this.onPressed,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.icon,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: margin,
      decoration: BoxDecoration(
        color: buttonColor ?? Globals.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: borderColor != null
            ? Border.all(
                color: borderColor ?? Colors.white, width: borderWidth ?? 1.5)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? Container(),
              isLoading ? Container(height: 10, width: 10) : Container(),
              isLoading
                  ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                          color: borderColor == null
                              ? Colors.white
                              : Globals.primaryColor))
                  : Text(
                      buttonText,
                      style: TextStyle(
                          color: buttonTextColor ?? Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
