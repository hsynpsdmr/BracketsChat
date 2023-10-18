import 'package:bracketschat/core/constants/navigation/navigation_constants.dart';
import 'package:bracketschat/view/home/view/home_view.dart';
import 'package:bracketschat/view/login/view/login_view.dart';
import 'package:bracketschat/view/onboard/view/onboard_view.dart';
import 'package:bracketschat/view/register/view/register_view.dart';
import 'package:bracketschat/view/splash/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    //Sayfa yönlendirmeleri buraya yazılır

    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView(), NavigationConstants.HOME_VIEW);
      case NavigationConstants.ONBOARD_VIEW:
        return normalNavigate(OnBoardView(), NavigationConstants.ONBOARD_VIEW);
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginView(), NavigationConstants.LOGIN_VIEW);
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(RegisterView(), NavigationConstants.REGISTER_VIEW);
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(SplashView(), NavigationConstants.SPLASH_VIEW);
      default:
        return normalNavigate(const Scaffold(), '');
    }
  }

  PageRoute normalNavigate(Widget widget, String pageName) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName)) : CupertinoPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName));
  }

  PageRoute normalNavigateToPop(Widget widget, String pageName) {
    return Platform.isAndroid ? MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName)) : CupertinoPageRoute(builder: (context) => widget, fullscreenDialog: true, settings: RouteSettings(name: pageName));
  }
}
