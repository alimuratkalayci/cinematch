import 'package:cinematch/components/custom_modal_bottom_sheet.dart';
import 'package:cinematch/features/auth/providers/auth_provider.dart';
import 'package:cinematch/features/auth/screens/login_screen/login_screen.dart';
import 'package:cinematch/features/auth/screens/register_screen/components/alternative_logins/register_page_app_store_login.dart';
import 'package:cinematch/features/auth/screens/register_screen/components/alternative_logins/register_page_facebook_login.dart';
import 'package:cinematch/features/auth/screens/register_screen/components/alternative_logins/register_page_google_login.dart';
import 'package:cinematch/features/auth/screens/register_screen/components/register_page_name_surname_field.dart';
import 'package:cinematch/features/auth/screens/register_screen/components/register_page_sign_up_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/ui_theme.dart';
import 'components/register_page_email_field.dart';
import 'components/register_page_password_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordRepeatController = TextEditingController();

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
                          'Hoşgeldiniz',
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
                        RegisterPageNameSurnameField(
                            controller: nameController),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RegisterPageEmailField(
                              controller: emailController),
                        ),
                        RegisterPagePasswordField(
                            controller: passwordController),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: RegisterPagePasswordField(
                              controller: passwordRepeatController),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                text: TextSpan(
                                  style: CustomTextStyle
                                      .circular12px400wWhiteOpacity50,
                                  children: [
                                    const TextSpan(
                                        text: "Kullanıcı sözleşmesini "),
                                    TextSpan(
                                      text: "okudum ve kabul ediyorum",
                                      style: CustomTextStyle
                                          .circular12px400wWhite
                                          .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("Okunacak veri açıldı");
                                        },
                                    ),
                                    const TextSpan(
                                        text:
                                            ". Bu sözleşmeyi okuyarak devam ediniz lütfen."),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 36),
                          child: Row(
                            children: [
                              Expanded(
                                child: RegisterPageSignUpButton(
                                  onPressed: () async {
                                    final email = emailController.text;
                                    final password = passwordController.text;
                                    final passwordRepeat =
                                        passwordRepeatController.text;
                                    final name = nameController.text;

                                    if (email.isEmpty ||
                                        password.isEmpty ||
                                        passwordRepeat.isEmpty ||
                                        name.isEmpty) {
                                      showCustomModal(
                                          context: context,
                                          title: 'Hata',
                                          message: 'Boş alan bırakılmaz.');
                                      return;
                                    }

                                    if (password != passwordRepeat) {
                                      showCustomModal(
                                          context: context,
                                          title: 'Hata',
                                          message: 'Şifreler uyuşmuyor.');
                                      return;
                                    }

                                    try {
                                      await Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .postRegistrationProvider(
                                              email, name, password);

                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  LoginScreen()));

                                      showCustomModal(
                                          context: context,
                                          title: 'Başarılı',
                                          message:
                                              'Kayıt olma başarıyla tamamlandı, giriş yapabilirsiniz');
                                    } catch (e) {
                                      showCustomModal(
                                          context: context,
                                          title: 'Hata',
                                          message: 'Kayıt olma başarısız');
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
                            RegisterPageGoogleLogin(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: RegisterPageAppStoreLogin(),
                            ),
                            RegisterPageFacebookLogin(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Zaten bir hesabın var mı?',
                                style: CustomTextStyle
                                    .circular12px400wWhiteOpacity50,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Giriş Yap!',
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
