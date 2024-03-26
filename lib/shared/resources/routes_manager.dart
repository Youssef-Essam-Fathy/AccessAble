
import 'package:accessable/pages/bottom_nav_bar_pages/profile.dart';
import 'package:accessable/pages/forget_password_page.dart';
import 'package:accessable/pages/home_page.dart';
import 'package:accessable/pages/notifications_page.dart';
import 'package:accessable/pages/profile_page.dart';
import 'package:accessable/pages/sign_in_page.dart';
import 'package:accessable/pages/sign_up_page.dart';
import 'package:accessable/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'strings_manager.dart';

// to add new page follow that 3 steps
// 1 - add String variable
// 2 - add case and return page
// 3 - add open method in ViewsManager

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static  const String notificationsRoute = "/notifications";
  static const String profileRoute = "/profile";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordPage());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.notificationsRoute:
        return MaterialPageRoute(builder: (_) => const NotificationsPage());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
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
