import 'package:fluro/fluro.dart';
import 'package:logger/logger.dart';

class GlobalVar {
  static Router router;
  static Logger logger =
      Logger(printer: PrettyPrinter(printTime: true, colors: true));
}
