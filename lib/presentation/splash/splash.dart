import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/resources/assets_manager.dart';
import 'package:kidvento_task/presentation/resources/colors_manager.dart';
import 'package:kidvento_task/presentation/resources/fonts_style_manager.dart';
import 'package:kidvento_task/presentation/resources/route_manager.dart';
import 'package:kidvento_task/presentation/resources/size_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p60),
              child: RichText(
                  text: TextSpan(
                      text: AppStrings.alreadyHaveAccount,
                      style: getRegularTextStyle(color: AppColors.white),
                      children: [
                    TextSpan(
                        text: AppStrings.login,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.loginRoute);
                          },
                        style: getMediumTextStyle(color: AppColors.white))
                  ])),
            ),
          ),
        ),
      ),
    );
  }
}
