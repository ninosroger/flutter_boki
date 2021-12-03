import 'package:fluro/fluro.dart';

import '../page/index/page.dart';
import '../page/navigation/page.dart';
import '../page/splash/page.dart';

import 'router_handlers.dart';

class Routers {
  static String root = "/";
  static String index = "/index";
  static String navigation = "/navigation";

  static FluroRouter configureRouters() {
    final router = FluroRouter();
    router.define(root, handler: getPageHandler(SplashPage()));
    router.define(index, handler: getPageHandler(IndexPage()));
    router.define(navigation, handler: getPageHandler(NavigationPage()));
    return router;
  }
}
