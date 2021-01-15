import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/resources/dimens.dart';
import 'package:flutter_boki/resources/styles.dart';
import 'package:flutter_boki/route/router_utils.dart';
import 'package:flutter_boki/route/routers.dart';
import 'package:lottie/lottie.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NavigationState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: Scaffold(
      backgroundColor: state.themeColors.background,
      body: Stack(
        children: [
          CarouselSlider(
            items: [
              Container(
                child: Lottie.asset(
                  'assets/lottie/man_office.json',
                  repeat: true,
                ),
              ),
              Container(
                child: Lottie.asset(
                  'assets/lottie/online_team.json',
                  repeat: true,
                ),
              ),
              Container(
                child: Lottie.asset(
                  'assets/lottie/woman_office.json',
                  repeat: true,
                ),
              ),
            ],
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => dispatch(
                  NavigationActionCreator.onPageChanged(index.toDouble())),
            ),
          ),
          Align(
            child: InkWell(
              onTap: () =>
                  FluroNavigator.push(viewService.context, Routers.index),
              child: SafeArea(
                child: Container(
                  width: 60,
                  height: 34,
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: Styles.linearGradientYellowToRedForLight,
                    borderRadius: BorderRadius.circular(10),
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
                    state.currentIndex == 2.0 ? '进入' : '跳过',
                    style: TextStyle(
                      color: state.themeColors.white,
                      fontSize: Dimens.font14,
                    ),
                  ),
                ),
              ),
            ),
            alignment: AlignmentDirectional.topEnd,
          ),
          Align(
            child: Container(
              margin: EdgeInsets.all(20),
              child: DotsIndicator(
                dotsCount: 3,
                position: state.currentIndex,
                decorator: DotsDecorator(
                  activeColor: state.themeColors.red,
                  size: const Size.square(8.0),
                  activeSize: const Size(16.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            alignment: AlignmentDirectional.bottomCenter,
          )
        ],
      ),
    ),
  );
}
