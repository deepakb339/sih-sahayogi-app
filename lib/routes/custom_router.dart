import 'package:flutter/material.dart';
import 'package:shg/CreateGroup.dart';
import 'package:shg/GroupPage.dart';
import 'package:shg/HomePage.dart';
import 'package:shg/pages/GetStarted.dart';
import 'package:shg/pages/SignInPage.dart';
import 'package:shg/pages/not_found_page.dart';
import 'package:shg/routes/route_names.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case getStartRoute:
        return MaterialPageRoute(builder: (_) => GetStarted());
      case signinRoute:
        return MaterialPageRoute(builder: (_) => SignInPage(''));
      // case otpVerifyRoute:
      //   return MaterialPageRoute(builder: (_) => OtpVerify());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case createGroupRoute:
        return MaterialPageRoute(builder: (_) => CreateGroup());
      case groupRoute:
        return MaterialPageRoute(builder: (_) => GroupPage());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
