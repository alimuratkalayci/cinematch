import 'package:cinematch/features/profile_screen/components/limited_offer_modal_bottom_sheet.dart';
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
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
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
                      limitedOfferModal(context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Lottie.network(
                              'https://lottie.host/79ebeea2-7a18-47d5-a0d7-8ffed5396f98/b3jE3s3M2a.json',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "Sınırlı Teklif",
                            style: CustomTextStyle.circular12px500wWhite,
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
