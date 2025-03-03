import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(18)
      ),
      child: const Icon(FontAwesomeIcons.facebookF,size: 20,color: Colors.white,),
    );
  }
}
