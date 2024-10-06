import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../constant/font_setup.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      this.titleButton,
      this.colorButton,
      this.height,
      this.width,
      this.textStyle});

  final String? titleButton;
  final Color? colorButton;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 57,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColor.primaryColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
            fixedSize: MaterialStatePropertyAll(Size.infinite)),
        child: Text(
          titleButton ?? '',
          style: textStyle ?? FontFamily.headlineMedium.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class BtnButtomNavBar extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? bgColor;

  const BtnButtomNavBar({
    super.key,
    required this.title,
    this.onPressed,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(blurRadius: 5, color: Colors.black12, offset: Offset(0, -2))
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: CustomButton(
        onPressed: onPressed,
        titleButton: title,
        height: 50,
      ),
    );
  }
}
