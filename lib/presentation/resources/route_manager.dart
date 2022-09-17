import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/forgot_password/forgot_password.dart';
import 'package:kidvento_task/presentation/login/login.dart';
import 'package:kidvento_task/presentation/main_view/main_view.dart';
import 'package:kidvento_task/presentation/reset_password/reset_password.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';
import 'package:kidvento_task/presentation/signup/signup.dart';
import 'package:kidvento_task/presentation/splash/splash.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/loginRoute";
  static const String forgotPasswordRoute = "/forgotPasswordRoute";
  static const String resetPasswordRoute = "/resetPasswordRoute";
  static const String signUpRoute = "/signUpRoute";
  static const String mainRoute = "/mainRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ResetPasswordView());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    Widget noFoundPage = Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.pageNotFound),
      ),
      body: const Center(
        child: Text(AppStrings.pageNotFound),
      ),
    );

    return MaterialPageRoute(builder: (_) => noFoundPage);
  }
}
