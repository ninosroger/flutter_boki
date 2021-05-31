import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/resources/res.dart';
import 'package:flutter_boki/route/route.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(NavigationState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: Scaffold(
      backgroundColor: state.themeColors.background,
      body: Stack(
        children: [
          PageView(
            children: [
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
            physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
            controller: state.controller,
          ),
          Align(
            child: InkWell(
              onTap: () => FluroNavigator.push(viewService.context, Routers.index, replace: true),
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
                      fontSize: 14,
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
              child: SmoothPageIndicator(
                controller: state.controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  expansionFactor: 2,
                  dotColor: state.themeColors.gray,
                  activeDotColor: state.themeColors.red,
                  dotWidth: 10,
                  dotHeight: 10,
                  radius: 5,
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
