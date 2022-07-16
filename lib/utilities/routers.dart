import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/pages/add_covers_compatibility_page.dart';
import 'package:wafaq_x/presentation/pages/add_mobile_page.dart';
import 'package:wafaq_x/presentation/pages/login_page.dart';
import 'package:wafaq_x/presentation/pages/all_covers_compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/brand_page.dart';
import 'package:wafaq_x/presentation/pages/compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/home_page.dart';
import 'package:wafaq_x/presentation/pages/landing_page.dart';
import 'package:wafaq_x/presentation/pages/mobile_page.dart';
import 'package:wafaq_x/presentation/pages/search_for_compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/selection_mobile_page.dart';
import 'package:wafaq_x/presentation/pages/set_admin_page.dart';
import 'routes.dart';


Route<dynamic> onGenerate(RouteSettings settings) {
  print('on Generate : ${settings.name}');
  switch (settings.name) {

    case AppRoutes.loginPage:
      return CupertinoPageRoute(
        builder: (_) => LoginPage(),
        settings: settings,
      );

    case AppRoutes.setAdminPage:
      return CupertinoPageRoute(
        builder: (_) => SetAdminPage(),
        settings: settings,
      );

    case AppRoutes.homePage:
      return CupertinoPageRoute(
        builder: (_) => HomePage(),
        settings: settings,
      );

    case AppRoutes.allCoversCompatibilitiesPage:
      return CupertinoPageRoute(
        builder: (_) => AllCoversCompatibilitiesPage(),
        settings: settings,
      );

    case AppRoutes.addSelectionPage:
      return CupertinoPageRoute(
        builder: (_) => AddSelectionPage(),
        settings: settings,
      );

    case AppRoutes.selectionMobilePage:
      return CupertinoPageRoute(
        builder: (_) => SelectionMobilePage(),
        settings: settings,
      );

    case AppRoutes.addMobilePage:
      return CupertinoPageRoute(
        builder: (_) => AddMobilePage(),
        settings: settings,
      );

    case AppRoutes.brandPage:
      return CupertinoPageRoute(
        builder: (_) => BrandPage(),
        settings: settings,
      );

    case AppRoutes.searchForCompatibilitiesPage:
      return CupertinoPageRoute(
        builder: (_) => SearchForCompatibilitiesPage(),
        settings: settings,
      );

    case AppRoutes.compatibilitiesPage:
      return CupertinoPageRoute(
        builder: (_) => CompatibilitiesPage(),
        settings: settings,
      );

    case AppRoutes.mobilePage:
      return CupertinoPageRoute(
        builder: (_) => MobilePage(),
        settings: settings,
      );

    case AppRoutes.landingPage:
    default:
      return CupertinoPageRoute(
        builder: (_) => LandingPage(),
        settings: settings,
      );


  }
}
