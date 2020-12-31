import 'package:fluro/fluro.dart';
import 'package:flutter_boki/util/event_bus.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class GlobalField {
  static Router router;
  static Logger logger;
  static Future<Database> database;
  static SharedPreferences prefs;
  static EventBus bus;
}
