import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'application.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boki/common/sql.dart';
import 'package:flutter_boki/net/api.dart';
import 'package:flutter_boki/net/net_manager.dart';
import 'package:flutter_boki/route/routers.dart';
import 'package:flutter_boki/util/event_bus.dart';
import 'package:flutter_boki/util/prefs_utils.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'common/global_field.dart';

import 'global_store/action.dart';
import 'global_store/store.dart';
import 'net/intercept.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //添加此处代码是为了防止下句代码报错

  init().then((value) => runApp(createApp()));

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

///初始化主题色
///初始化网络请求
///初始化全局变量
Future init() async {
  final List<Interceptor> interceptors = [];
  interceptors.add(LoggingInterceptor());
  interceptors.add(AdapterInterceptor());
  setInitDio(
    baseUrl: Api.baseUrl,
    interceptors: interceptors,
  );

  GlobalField.bus = EventBus();
  GlobalField.router = Routers.configureRouters();
  GlobalField.prefs = await SharedPreferences.getInstance();
  GlobalField.logger =
      Logger(printer: PrettyPrinter(printTime: true, colors: true));
  GlobalField.database = openDatabase(
    join(await getDatabasesPath(), Sqls.databaseName),
    version: 1,
    onCreate: (db, version) {
      db.execute(Sqls.createUsersTable);
      db.execute(Sqls.createLedgerTable);
      db.execute(Sqls.createBannersTable);
      db.execute(Sqls.createMessagesTable);
      db.execute(Sqls.createPropertyTable);
      db.execute(Sqls.createPasswordsTable);
      db.execute(Sqls.createPiggyBankTable);
      db.execute(Sqls.createBookkeepingTable);
      db.execute(Sqls.createPiggyBankRecordTable);
      db.execute(Sqls.createAutomaticInsertionTable);
      db.execute(Sqls.createIncomeExpenditureTypesTable);
      return db;
    },
  );
  GlobalStore.store
      .dispatch(GlobalActionCreator.onchangeThemeColor(getThemeName()));
}
