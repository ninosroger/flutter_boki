import 'package:fluro/fluro.dart';
import 'package:flutter_boki/route/route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";

  static Router configureRoutes() {
    var router = Router();
    router.define(root, handler: indexHandler);
    return router;
  }
}
