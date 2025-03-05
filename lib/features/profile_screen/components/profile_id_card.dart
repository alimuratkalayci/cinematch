import 'package:cinematch/constants/ui_theme.dart';
import 'package:cinematch/features/profile_screen/details_page/photo_add_page/photo_add_page.dart';
import 'package:flutter/material.dart';

class ProfileIdCard extends StatelessWidget {
  final String id;
  final String name;
  final String photoUrl;
  const ProfileIdCard({super.key, required this.id, required this.name, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(photoUrl ?? ''),
            child: const Icon(Icons.person, size: 40),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: CustomTextStyle.circular15px500wWhite
              ),
              SizedBox(height: 4),
              Text(
                'ID: $id',
                style: CustomTextStyle.circular12px400wWhiteOpacity50,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )

            ],
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhotoAddPage()),
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
                'Fotoğraf Ekle',
                style: CustomTextStyle.circular13pxBoldWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
