import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: Lottie.asset('assets/lottie/pink_top.json'),
            )
          ],
        )),
  );
}
