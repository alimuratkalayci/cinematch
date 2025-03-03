import 'package:cinematch/constants/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({Key? key, required this.controller}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: CustomTextStyle.circular12px400wWhiteOpacity50,
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        labelText: 'Şifre',
        labelStyle: CustomTextStyle.circular12px400wWhiteOpacity50,
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2), width: 1), // Normal durumda border rengi
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.2), width: 2), // Focus durumda border rengi
          borderRadius: BorderRadius.circular(18),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 24,right: 8),
          child: Icon(IconlyLight.unlock, color: Colors.white,size: 14,),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16,left: 8),
          child: IconButton(
            icon: Icon(
              _isObscure ? IconlyBroken.hide : IconlyLight.show,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
        ),
      ),
    );
  }
}
