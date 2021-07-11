import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_images.dart';
import '../../shared/themes/app_text_styles.dart';
import '../../shared/widget/login_button.dart';
import './login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  AppImages.person,
                  height: 300,
                  width: 208,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.07,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 40, top: 30, left: 40),
                    child: SocialLoginButton(
                      onTap: () => loginController.googleSignIn(context),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
