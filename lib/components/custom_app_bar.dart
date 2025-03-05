import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../constants/ui_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLimitedOffer;
  final bool showLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showLimitedOffer = false,
    this.showLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      automaticallyImplyLeading: false,
      title: Stack(
        alignment: Alignment.center,
        children: [
          // Centered "Profil" text
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Text(title, style: CustomTextStyle.circular18px600wWhite),
            ),
          ),

          if (showLimitedOffer)
            Positioned(
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.buttonRed,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      // Buton aksiyonu
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Lottie.network(
                                'https://lottie.host/f5127718-3f1f-4cf0-a77c-204fed17ba3b/gmbcHGk3fX.json',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "Sınırlı Teklif",
                            style: CustomTextStyle.MontSerrat15pxMediumWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          if (showLeading)
            Positioned(
              left: 0,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: IconButton(
                  icon: Icon(IconlyLight.arrow_left, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
