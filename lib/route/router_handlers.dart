import 'package:fluro/fluro.dart';
import 'package:flutter_boki/page/index/page.dart';

var indexHandler = Handler(handlerFunc: (context, parameters) {
  return IndexPage().buildPage(parameters);
});
