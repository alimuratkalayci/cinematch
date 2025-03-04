import 'package:flutter/material.dart';
import '../../../../../constants/ui_theme.dart';

class RegisterPageSignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterPageSignUpButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffE50914),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
      child: Text(
        'Şimdi Kaydol',
        style: CustomTextStyle.circular15pxMedium,
      ),
    );
  }
}
