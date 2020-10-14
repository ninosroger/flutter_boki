import 'package:fluro/fluro.dart';
import 'package:flutter_boki/route/router_handlers.dart';

class Routers {
  static String root = "/";
  static String home = "/home";

  static Router configureRouters() {
    final router = Router();
    router.define(root, handler: indexHandler);
    return router;
  }
}
