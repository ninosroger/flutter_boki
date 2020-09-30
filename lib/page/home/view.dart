import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Lottie.asset('assets/pink_top.json'),
          )
        ],
      ));
}
