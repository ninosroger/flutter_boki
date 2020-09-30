import 'package:fluro/fluro.dart';
import 'package:flutter_boki/route/route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";

  static Router configureRoutes() {
    final router = Router();
    router.define(root, handler: indexHandler);
    return router;
  }
}
