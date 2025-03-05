import 'package:cinematch/components/custom_app_bar.dart';
import 'package:cinematch/constants/ui_theme.dart';
import 'package:flutter/material.dart';

class PhotoAddPage extends StatelessWidget {
  const PhotoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profil Detayı',showLeading: true,),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Text('Fotoğraflarınızı Yükleyin',style: CustomTextStyle.circular18px600wWhite,)
        ],
      ),
    );
  }
}
