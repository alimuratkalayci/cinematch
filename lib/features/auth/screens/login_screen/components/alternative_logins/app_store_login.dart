import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppStoreLogin extends StatelessWidget {
  const AppStoreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonSize = MediaQuery.of(context).size.width * 0.14;
    double iconSize = buttonSize * 0.35;

    return Container(
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(buttonSize * 0.3),
      ),
      child: Icon(
        FontAwesomeIcons.apple,
        size: iconSize,
        color: Colors.white,
      ),
    );
  }
}
