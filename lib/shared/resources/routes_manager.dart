
import 'package:accessable/pages/customer_sign_up_page.dart';
import 'package:accessable/pages/forget_password_page.dart';
import 'package:accessable/pages/home_page.dart';
import 'package:accessable/pages/sign_in_page.dart';
import 'package:accessable/pages/sign_up_page.dart';
import 'package:accessable/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:accessable/pages/business_sign_up_page.dart';
import 'package:accessable/pages/specify_user_page.dart';
import 'package:accessable/pages/individual_sign_up_page.dart';
import 'strings_manager.dart';

// to add new page follow that 3 steps
// 1 - add String variable
// 2 - add case and return page
// 3 - add open method in ViewsManager

class Routes {
  static const String splashRout = "/";
  static const String loginRout = "/login";
  static const String registerRout = "/register";
  static const String forgotPasswordRout = "/forgetPassword";
  static const String mainRout = "/main";
  static const String specifyUserPage = "/specifyUserPage";
  static const String customerSignUp = "/customerSignUp";
  static const String businessSignUp = "/businessSignUp";
  static const String individualSignUp = "/individualSignUp";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRout:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.loginRout:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case Routes.registerRout:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.forgotPasswordRout:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordPage());
      case Routes.mainRout:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.specifyUserPage:
        return MaterialPageRoute(builder: (_) => const SpecifyUserPage());
      case Routes.customerSignUp:
        return MaterialPageRoute(builder: (_) => const CustomerSignUpPage());
      case Routes.businessSignUp:
        return MaterialPageRoute(builder: (_) => const BusinessSignUpPage());
      case Routes.individualSignUp:
        return MaterialPageRoute(builder: (_) => const IndividualSignUp());
      default:
        return _unDefinedRout();
    }
  }

  static Route<dynamic> _unDefinedRout() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringsManager.noRouteFound),
              ),
              body: const Center(
                child: Text(StringsManager.noRouteFound),
              ),
            ));
  }
}
