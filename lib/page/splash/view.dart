import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/resources/dimens.dart';
import 'package:flutter_boki/resources/styles.dart';
import 'package:lottie/lottie.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: Scaffold(
      backgroundColor: state.themeColors.background,
      body: Stack(
        children: [
          Align(
            child: Container(
              child: Lottie.asset(
                'assets/lottie/young_businessmen.json',
                repeat: true,
              ),
            ),
          ),
          Align(
            child: SafeArea(
              child: Container(
                width: 34,
                height: 34,
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: Styles.linearGradientYellowToRedForLight,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: state.themeColors.red,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Text(
                  state.second.toString(),
                  style: TextStyle(
                    color: state.themeColors.white,
                    fontSize: Dimens.font14,
                  ),
                ),
              ),
            ),
            alignment: AlignmentDirectional.topEnd,
          ),
        ],
      ),
    ),
  );
}
