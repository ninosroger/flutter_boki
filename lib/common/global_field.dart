import 'package:fluro/fluro.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/event_bus.dart';

class GlobalField {
  static FluroRouter router;
  static Logger logger;
  static SharedPreferences prefs;
  static EventBus bus;
}
