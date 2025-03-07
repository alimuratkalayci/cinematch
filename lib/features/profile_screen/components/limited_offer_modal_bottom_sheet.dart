import 'package:cinematch/constants/ui_theme.dart';
import 'package:cinematch/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> limitedOfferModal({
  required BuildContext context,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
    builder: (BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      final notchWidth = screenWidth * 0.20;
      final notchHeight = screenHeight * 0.005;

      return Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            focal: Alignment.topCenter,
            radius: 0.7,
            colors: [
              Color(0xffE50914),
              Colors.black,
            ],
            stops: [0.1, 0.9],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: notchWidth,
                  height: notchHeight,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(AppLocalizations.of(context)!.translate('limited_offer'),
                  style: CustomTextStyle.circular18px600wWhite),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!
                      .translate('choose_jeton_package'),
                  style: CustomTextStyle.circular12px400wWhite,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.1), width: 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('bonuses_you_will_receive'),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: buildLottieBonusOptions(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.translate('select_token_pack'),
                  style: CustomTextStyle.circular15px500wWhite),
              const SizedBox(height: 12),
              buildTokenPackages(context),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: const Color(0xffE50914),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                            AppLocalizations.of(context)!
                                .translate('see_all_tokens'),
                            style: CustomTextStyle.circular15pxMediumWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildLottieBonusOptions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildLottieBonusItem(
          '${AppLocalizations.of(context)!.translate('premium')} \n ${AppLocalizations.of(context)!.translate('account')}',
          'https://lottie.host/514b923b-7e7b-420a-a80d-44f58375cbb3/RFtgtJ5KVr.json'),
      buildLottieBonusItem(
          '${AppLocalizations.of(context)!.translate('more')} \n ${AppLocalizations.of(context)!.translate('matches')}',
          'https://lottie.host/8b30e0f1-f389-4257-b591-c50dd3407469/CfmUwzcxca.json'),
      buildLottieBonusItem(
          '${AppLocalizations.of(context)!.translate('highlight')}',
          'https://lottie.host/78b0d79d-82cd-48f7-a125-577e8d7d343d/ITZP1la96B.json'),
      buildLottieBonusItem(
          '${AppLocalizations.of(context)!.translate('more')} \n ${AppLocalizations.of(context)!.translate('likes')}',
          'https://lottie.host/0c17a2cc-42ca-48c2-a7dc-14363206819e/8ubpugN5oK.json'),
    ],
  );
}

Widget buildLottieBonusItem(String text, String lottieUrl) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
          gradient: RadialGradient(
            colors: [
              AppColors.buttonRed.withOpacity(0.00001),
              Colors.white.withOpacity(0.9),
            ],
          ),
        ),
        child: ClipOval(
          child: Lottie.network(
            lottieUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error, color: Colors.white);
            },
          ),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        text,
        style: const TextStyle(fontSize: 10, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget buildTokenPackages(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildTokenPackage('+10%', '200', '330', '99,99 TL', context),
      buildTokenPackage(
          '+70%', '2.000', '3.375', '799,99 TL', isHighlighted: true, context),
      buildTokenPackage('+35%', '1.000', '1.350', '399,99 TL', context),
    ],
  );
}

Widget buildTokenPackage(String bonusText, String baseAmount,
    String totalAmount, String price, BuildContext context,
    {bool isHighlighted = false}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          color: isHighlighted ? null : const Color(0xFFAA1F23),
          gradient: isHighlighted
              ? const RadialGradient(
                  colors: [
                    Color(0xff5949E6),
                    Color(0xffE50914),
                  ],
                  center: Alignment.topCenter,
                  radius: 2.0,
                )
              : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              baseAmount,
              style: CustomTextStyle.circular15px500wWhite.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white),
            ),
            Text(
              totalAmount,
              style: CustomTextStyle.MontSerrat15pxMediumWhite.copyWith(
                  fontSize: 25, fontWeight: FontWeight.w900),
            ),
            Text(
              AppLocalizations.of(context)!.translate('token'),
              style: CustomTextStyle.circular15px500wWhite,
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: CustomTextStyle.circular15px500wWhite,
            ),
            Text(
              AppLocalizations.of(context)!.translate('weekly'),
              style:
                  CustomTextStyle.circular12px400wWhite.copyWith(fontSize: 10),
            ),
          ],
        ),
      ),
      Positioned(
        top: -10,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color:
                  isHighlighted ? Colors.purple.shade900 : Colors.red.shade900,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.6),
                width: 1,
              ),
            ),
            child:
                Text(bonusText, style: CustomTextStyle.circular12px400wWhite),
          ),
        ),
      ),
    ],
  );
}
