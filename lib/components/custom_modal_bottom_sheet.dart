import 'package:cinematch/constants/ui_theme.dart';
import 'package:flutter/material.dart';


Future<void> showCustomModal({
  required BuildContext context,
  required String title,
  required String message,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),
      ),
    ),
    builder: (BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      final notchWidth = screenWidth * 0.20;
      final notchHeight = screenHeight * 0.005;

      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: notchWidth,
                height: notchHeight,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 0,bottom: 16,left: 8,right: 8),
              child: Text(
                title,
                style: CustomTextStyle.circular18px600wWhite.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16,left: 8,right: 8),
              child: Text(
                message,
                style: CustomTextStyle.circular15px500wWhite,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        backgroundColor: const Color(0xffE50914),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Okay', style: CustomTextStyle.circular15pxMediumWhite,),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
