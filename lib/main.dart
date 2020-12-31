import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'application.dart';

void main() {
  runApp(createApp());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
