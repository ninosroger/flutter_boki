import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/resources/dimens.dart';
import 'package:flutter_boki/resources/gaps.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import 'action.dart';
import 'hover_header_vm.dart';
import 'state.dart';

Widget buildView(HoverDataListState state, Dispatch dispatch, ViewService viewService) {
  var incomeExpenditureView = Column(
    children: [
      Container(
        height: 80,
        color: state.themeColors.white,
      ),
      Container(
        height: 90,
        color: state.themeColors.white,
        child: Row(
          children: [
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
                        color: state.themeColors.gray,
                      ),
                      Text(
                        '收入',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Dimens.font11,
                          color: state.themeColors.gray,
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
                  Gaps.vSpace8,
                  Text(
                    '￥ 2416.14',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimens.font18,
                      color: state.themeColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: state.themeColors.lightGray,
              width: 0.6,
              indent: 35,
              endIndent: 35,
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
                        color: state.themeColors.gray,
                      ),
                      Text(
                        '支出',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Dimens.font11,
                          color: state.themeColors.gray,
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
                  Gaps.vSpace8,
                  Text(
                    '￥ 3254.65',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimens.font18,
                      color: state.themeColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
  var incomeExpenditureHeader = Container(
    height: 40,
    color: state.themeColors.white,
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Row(
      children: [
        Text(
          '5月13日 星期日',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: Dimens.font11,
            color: state.themeColors.gray,
          ),
        ),
        Expanded(
          child: Gaps.hSpace10,
        ),
        Text(
          '收入：1500',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: Dimens.font11,
            color: state.themeColors.gray,
          ),
        ),
        Gaps.hSpace10,
        Text(
          '支出：650',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: Dimens.font11,
            color: state.themeColors.gray,
          ),
        ),
      ],
    ),
  );
  var incomeExpenditureCell = SlideAnimation(
    horizontalOffset: 200.0,
    child: FadeInAnimation(
      child: Container(
        height: 64,
        color: state.themeColors.white,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Container(
              height: 59.4,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/icon_income_expenditure5.png",
                    width: 30,
                    height: 30,
                  ),
                  Gaps.hSpace10,
                  Text(
                    '早餐-支付宝',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimens.font14,
                      color: state.themeColors.black,
                    ),
                  ),
                  Expanded(
                    child: Gaps.hSpace20,
                  ),
                  Text(
                    '-22.51',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Dimens.font16,
                      color: state.themeColors.red,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: state.themeColors.lightGray,
              height: 0.6,
              indent: 40,
            )
          ],
        ),
      ),
    ),
  );
  return Stack(
    children: <Widget>[
      AnimationLimiter(
        child: CustomScrollView(
          controller: state.scrollController,
          //统一滑动效果，同iOS越界回弹
          physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
          slivers: List.generate(
            state.titles.length,
                (titleIndex) {
              String title = state.titles[titleIndex];
              List<String> dataList = state.data[title];
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                        (ctx, cellIndex) {
                      if (cellIndex == 0) {
                        if (title.isEmpty)
                          return Container(
                            height: 0,
                          );
                        else
                          return incomeExpenditureHeader;
                      } else {
                        if (title.isEmpty)
                          return incomeExpenditureView;
                        else {
                          int fixIndex = cellIndex - 1;
                          String data = dataList[fixIndex];
                          return AnimationConfiguration
                              .staggeredList(
                            position: cellIndex,
                            duration: const Duration(
                                milliseconds: 500),
                            child: incomeExpenditureCell,
                          );
                        }
                      }
                    }, childCount: dataList.length + 1),
              );
            },
          ),
        ),
      ),
      Consumer(
        builder: (ctx, HoverHeaderVM hoverVM, child) {
          return Visibility(
            visible: hoverVM.show,
            child: Container(
              height: 40,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -hoverVM.offset,
                    child: Container(
                      height: 40,
                      width:
                      MediaQuery.of(viewService.context).size.width,
                      color: state.themeColors.white,
                      padding:
                      EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Text(
                            '5月13日 星期日',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Dimens.font11,
                              color: state.themeColors.gray,
                            ),
                          ),
                          Expanded(
                            child: Gaps.hSpace10,
                          ),
                          Text(
                            '收入：1500',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Dimens.font11,
                              color: state.themeColors.gray,
                            ),
                          ),
                          Gaps.hSpace10,
                          Text(
                            '支出：650',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Dimens.font11,
                              color: state.themeColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
    ],
  );
}
