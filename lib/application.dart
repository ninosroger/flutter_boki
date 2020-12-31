import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/common/sql.dart';
import 'package:flutter_boki/net/api.dart';
import 'package:flutter_boki/net/net_manager.dart';
import 'package:flutter_boki/route/routers.dart';
import 'package:flutter_boki/util/event_bus.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'common/global_field.dart';
import 'net/intercept.dart';

Widget createApp() {
  init();

  return MaterialApp(
    title: "簿记岛",
    //debug标识去掉
    debugShowCheckedModeBanner: false,
    builder: (context, child) {
      // 保证文字大小不受手机系统设置影响
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child,
      );
    },
    //注册路由
    onGenerateRoute: GlobalField.router.generator,
  );
}

///初始化网络请求
///初始化全局变量
init() async {
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
}
