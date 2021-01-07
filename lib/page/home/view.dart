import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/resources/dimens.dart';
import 'package:flutter_boki/resources/gaps.dart';
import 'package:flutter_boki/resources/styles.dart';
import 'package:flutter_boki/util/toast_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light,
    child: DrawerScaffold(
      controller: state.controller,
      drawers: [
        SideDrawer(
          direction: Direction.right,
          degree: 45,
          percentage: 0.8,
          animation: true,
        ),
      ],
      builder: (context, id) => Container(
        color: state.themeColors.white,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 14, 20, 130),
              decoration: BoxDecoration(
                  gradient: Styles.linearGradientYellowToRedForLight),
              child: SafeArea(
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '今天是你记账的',
                              style: TextStyle(
                                fontSize: Dimens.font11,
                                color: state.themeColors.white,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '32',
                                  style: TextStyle(
                                    fontSize: Dimens.font25,
                                    color: state.themeColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(4, 0, 4, 5),
                                  child: Text(
                                    '天',
                                    style: TextStyle(
                                      fontSize: Dimens.font11,
                                      color: state.themeColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          state.controller.toggle(Direction.right);
                        },
                        child: ImageIcon(
                          AssetImage('assets/images/icon_copy.png'),
                          color: state.themeColors.white,
                          size: 25.0,
                        ),
                      ),
                      Gaps.hSpace16,
                      InkWell(
                        onTap: () {
                        },
                        child: ImageIcon(
                          AssetImage('assets/images/icon_search.png'),
                          color: state.themeColors.white,
                          size: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: state.themeColors.white,
                borderRadius: Styles.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: state.themeColors.lightGray,
                    offset: Offset(1, 1),
                    blurRadius: 8.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              margin: EdgeInsets.fromLTRB(18, 120, 18, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '当月预算',
                        style: TextStyle(
                          color: state.themeColors.black,
                          fontSize: Dimens.font18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Gaps.hSpace10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2021年',
                            style: TextStyle(
                              fontSize: Dimens.font11,
                              color: state.themeColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '5月',
                                style: TextStyle(
                                  fontSize: Dimens.font18,
                                  color: state.themeColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                color: state.themeColors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gaps.vSpace16,
                  Text(
                    '预算余额',
                    style: TextStyle(
                      fontSize: Dimens.font11,
                      color: state.themeColors.gray,
                    ),
                  ),
                  Gaps.vSpace6,
                  Row(
                    children: [
                      Container(
                        height: 36,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '￥',
                          style: TextStyle(
                            fontSize: Dimens.font16,
                            color: state.themeColors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Gaps.hSpace4,
                      Text(
                        '2319.43',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: Dimens.font40,
                            color: state.themeColors.red,
                          ),
                        ),
                      ),
                      Gaps.hSpace10,
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: state.themeColors.gray,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
