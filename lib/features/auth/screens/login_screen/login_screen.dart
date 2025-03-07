import 'package:cinematch/components/custom_modal_bottom_sheet.dart';
import 'package:cinematch/features/auth/providers/auth_provider.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/alternative_logins/login_page_app_store_login.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/alternative_logins/login_page_facebook_login.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/login_page_email_field.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/login_page_login_button.dart';
import 'package:cinematch/features/auth/screens/login_screen/components/login_page_password_field.dart';
import 'package:cinematch/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/ui_theme.dart';
import '../register_screen/register_screen.dart';
import 'components/alternative_logins/login_page_google_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        LoginPageEmailField(controller: emailController),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 36),
                          child: LoginPagePasswordField(
                              controller: passwordController),
                        ),
                        Row(
                          children: [
                            Text(
                              'Şifremi unuttum',
                              style: CustomTextStyle.circular12px400wWhite
                                  .copyWith(
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
                                child: LoginPageLoginButton(
                                  onPressed: () async {
                                    final email = emailController.text;
                                    final password = passwordController.text;

                                    if (email.isEmpty || password.isEmpty) {
                                      showCustomModal(
                                          context: context,
                                          title: 'Hata',
                                          message: 'Boş alan bırakılmaz.');
                                      return;
                                    }

                                    try {
                                      await Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .postLoginProvider(email, password);

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  RootScreen()));
                                    } catch (e) {
                                      showCustomModal(
                                          context: context,
                                          title: 'Giriş başarısız',
                                          message:
                                              'Lütfen bilgilerinizi kontrol edin');
                                    }
                                  },
                                ),
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
                          padding: const EdgeInsets.only(top: 32, bottom: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Bir hesabın yok mu?',
                                style: CustomTextStyle
                                    .circular12px400wWhiteOpacity50,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Kayıt Ol!',
                                    style:
                                        CustomTextStyle.circular12px400wWhite,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
