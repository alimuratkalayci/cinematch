import 'package:cinematch/features/auth/screens/login_screen/components/alternative_logins/app_store_login.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/alternative_logins/facebook_login.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/email_field.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/login_button.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/password_field.dart';
import 'package:flutter/material.dart';
import '../../../../constants/ui_theme.dart';
import '../register_screen/register_screen.dart';
import 'components/alternative_logins/google_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController eMailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
                child: Text(
              'Merhabalar',
              style: CustomTextStyle.circular18px600wWhite,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 40),
              child: Center(
                child: Text(
                  'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
                  style: CustomTextStyle.circular13px400wWhite,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            EmailField(controller: eMailController),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 36),
              child: PasswordField(controller: passwordController),
            ),
            Row(
              children: [
                Text(
                  'Şifremi unuttum',
                  style: CustomTextStyle.circular12px400wWhite.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 1,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 36),
              child: Row(
                children: [
                  Expanded(
                    child: LoginButton(onPressed: () {}),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GoogleLogin(),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: AppStoreLogin(),
                ),
                FacebookLogin(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Bir hesabın yok mu?',
                    style: CustomTextStyle.circular12px400wWhiteOpacity50,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: Text(
                        'Kayıt Ol!',
                        style: CustomTextStyle.circular12px400wWhite,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
