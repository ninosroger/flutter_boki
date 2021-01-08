import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/resources/dimens.dart';
import 'package:flutter_boki/resources/gaps.dart';
import 'package:flutter_boki/resources/styles.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light,
    child: DrawerScaffold(
      controller: state.drawerController,
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
            //顶部记账天数、账本和搜索
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20, 14, 20, 114),
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
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
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
                              state.drawerController.toggle(Direction.right);
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
                              state.cardMoveStatus
                                  ? state.smallMoveController.reverse()
                                  : state.cardMoveController.forward();
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
              ],
            ),
            //固定收入支出
            FadeTransition(
              opacity: state.topAnimation,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
                  child: Row(
                    children: [
                      Gaps.hSpace70,
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Entypo.dot_single,
                                  size: 14,
                                  color: state.themeColors.white,
                                ),
                                Text(
                                  '收入',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: Dimens.font11,
                                    color: state.themeColors.white,
                                  ),
                                ),
                                Gaps.hSpace4,
                                Container(
                                  padding: EdgeInsets.fromLTRB(6, 1, 6, 1),
                                  decoration: BoxDecoration(
                                    color: state.themeColors.lightGreen,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: state.themeColors.lightGray,
                                        offset: Offset(2.0, 4.0),
                                        blurRadius: 8.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '+18%',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: Dimens.font11,
                                      color: state.themeColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gaps.vSpace5,
                            Text(
                              '￥ 2416.14',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Dimens.font18,
                                color: state.themeColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Entypo.dot_single,
                                  size: 14,
                                  color: state.themeColors.white,
                                ),
                                Text(
                                  '支出',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: Dimens.font11,
                                    color: state.themeColors.white,
                                  ),
                                ),
                                Gaps.hSpace4,
                                Container(
                                  padding: EdgeInsets.fromLTRB(6, 1, 6, 1),
                                  decoration: BoxDecoration(
                                    color: state.themeColors.red,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: state.themeColors.lightGray,
                                        offset: Offset(2.0, 4.0),
                                        blurRadius: 8.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    '-23%',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: Dimens.font11,
                                      color: state.themeColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Gaps.vSpace5,
                            Text(
                              '￥ 3254.65',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Dimens.font18,
                                color: state.themeColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //预算card
            SlideTransition(
              position: state.cardMoveAnimation,
              child: SafeArea(
                child: Container(
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
                  margin: EdgeInsets.fromLTRB(18, 84, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '当月预算',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
              ),
            ),
            //侧边日期card
            SlideTransition(
              position: state.smallMoveAnimation,
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(56, 16, 16, 16),
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
                  transform: Matrix4.translationValues(-216, 84, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2021年',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
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
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
