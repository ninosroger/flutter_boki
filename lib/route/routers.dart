import 'package:fluro/fluro.dart';
import 'package:flutter_boki/page/index/page.dart';
import 'package:flutter_boki/page/navigation/page.dart';
import 'package:flutter_boki/page/splash/page.dart';
import 'package:flutter_boki/route/router_handlers.dart';

class Routers {
  static String root = "/";
  static String index = "/index";
  static String navigation = "/navigation";

  static Router configureRouters() {
    final router = Router();
    router.define(root, handler: getPageHandler(SplashPage()));
    router.define(index, handler: getPageHandler(IndexPage()));
    router.define(navigation, handler: getPageHandler(NavigationPage()));
    return router;
  }
}
