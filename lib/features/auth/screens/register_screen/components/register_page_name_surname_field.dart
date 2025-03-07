import 'package:cinematch/constants/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RegisterPageNameSurnameField extends StatelessWidget {
  final TextEditingController controller;

  const RegisterPageNameSurnameField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: CustomTextStyle.circular12px400wWhiteOpacity50,
      controller: controller,
      decoration: InputDecoration(
        labelStyle: CustomTextStyle.circular12px400wWhiteOpacity50,
        labelText: 'Ad Soyad',
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          gapPadding: 24,
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.2), width: 2),
          borderRadius: BorderRadius.circular(18),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 24, right: 8),
          child: Icon(
            IconlyLight.user,
            color: Colors.white,
            size: 14,
          ),
        ),
      ),
    );
  }
}
