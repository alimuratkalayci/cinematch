import 'package:cinematch/constants/ui_theme.dart';
import 'package:cinematch/features/profile_screen/details_page/photo_add_page/photo_add_page.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';

class ProfileIdCard extends StatelessWidget {
  final String id;
  final String name;
  final String photoUrl;
  const ProfileIdCard(
      {super.key,
      required this.id,
      required this.name,
      required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage:
                photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
            backgroundColor: Colors.grey[800],
            child: photoUrl.isEmpty
                ? const Icon(Icons.person, color: Colors.white, size: 32)
                : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(name, style: CustomTextStyle.circular15px500wWhite),
                Text(
                  'ID: ${id.substring(0, 6)}',
                  style: CustomTextStyle.circular12px400wWhiteOpacity50,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const PhotoAddPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE50914),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                AppLocalizations.of(context)!.translate('add_photo'),
                style: CustomTextStyle.circular13pxBoldWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
