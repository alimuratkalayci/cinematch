import 'package:cinematch/features/auth/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

import '../../constants/ui_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Expanded(
              flex: 48,
              child: Lottie.network(
                'https://lottie.host/9eaf6df5-08ea-449c-9de5-09a25e3fdb3d/SfUupsXYP9.json',
                width: screenWidth * 1,
                height: screenHeight * 1,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(flex: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text.rich(
                    TextSpan(
                      text: "Welcome to ",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "CineMatch",
                          style: TextStyle(
                            color: AppColors.buttonRed,  // CineMatch kısmı kırmızı olacak
                            fontWeight: FontWeight.bold, // Aynı fontWeight ile kırmızı yapalım
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 8,),
                  Icon(Icons.movie_creation_outlined,color: Colors.white,)
                ],
              ),


            ),
            const Spacer(flex: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Text("Sevdiğin filme göre hemen eşleş!",
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.circular18px600wWhite),
            ),
            const Spacer(flex: 8),
            FittedBox(
              child: TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "İleri",
                      style: CustomTextStyle.circular15px500wWhite
                          .copyWith(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.white)
                  ],
                ),
              ),
            ),
            const Spacer(flex: 8),
          ],
        ),
      ),
    );
  }
}
