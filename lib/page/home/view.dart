import 'dart:ui';

import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/resources/res.dart';
import 'package:flutter_boki/widget/dotted_decoration.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'hover_header_vm.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
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
      child: Material(
        color: state.themeColors.white,
        child: InkWell(
          splashColor: state.themeColors.lightGray, // 溅墨色（波纹色）
          highlightColor: state.themeColors.transparent, // 点击时的背景色（高亮色）
          onTap: () {},
          child: Container(
            height: 64,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Container(
                  height: 63.4,
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
      ),
    ),
  );
  return ChangeNotifierProvider(
    create: (ctx) {
      return state.hoverVM;
    },
    child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: LayoutBuilder(
        builder: (context, constraints) => DrawerScaffold(
          controller: state.drawerController,
          drawers: [
            SideDrawer(
              direction: Direction.right,
              degree: 45,
              percentage: 0.8,
              animation: true,
              color: state.themeColors.yellow,
              menu: Menu(items: []),
              headerView: Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(gradient: Styles.linearGradientTopYellowToBottomRedForLight),
                      height: 250,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 250),
                      height: constraints.maxHeight - 250,
                      width: constraints.maxWidth,
                      padding: EdgeInsets.fromLTRB(constraints.maxWidth * 0.2, 0, 0, 0),
                      decoration: BoxDecoration(color: state.themeColors.white),
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 280,
                            margin: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              color: state.themeColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(14.0),
                                bottomLeft: Radius.circular(6.0),
                                bottomRight: Radius.circular(14.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: state.themeColors.lightGray,
                                  offset: Offset(1, 1),
                                  blurRadius: 8.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                //渐变封面
                                Container(
                                  width: 200,
                                  height: 200,
                                  alignment: Alignment.bottomLeft,
                                  padding: EdgeInsets.fromLTRB(14, 0, 14, 8),
                                  decoration: BoxDecoration(
                                    gradient: Styles.linearGradientRedToYellowForLight,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6.0),
                                      topRight: Radius.circular(14.0),
                                    ),
                                  ),
                                  child: Text(
                                    "生活账本",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: state.themeColors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimens.font16,
                                    ),
                                  ),
                                ),
                                //虚线
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 8, 8, 8),
                                  width: 192,
                                  height: 264,
                                  decoration: DottedDecoration(
                                    color: state.themeColors.lightGray,
                                    shape: Shape.line,
                                    linePositions: [LinePosition.top, LinePosition.right, LinePosition.bottom],
                                    dash: [4, 4],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(14.0),
                                      bottomRight: Radius.circular(14.0),
                                    ),
                                  ),
                                ),
                                //记录天数
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.fromLTRB(14, 14, 14, 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '一共记录了',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 8,
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
                                              fontSize: Dimens.font12,
                                              color: state.themeColors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                            child: Text(
                                              '天',
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: state.themeColors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                //账本信息
                                Container(
                                  margin: EdgeInsets.fromLTRB(14, 208, 14, 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        '共记录了 140 笔',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: Dimens.font12,
                                          color: state.themeColors.gray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  child: Container(
                                    margin: EdgeInsets.all(14),
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: state.themeColors.lightGray,
                                      size: 20,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional.bottomEnd,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
          builder: (context, id) => Container(
            color: state.themeColors.white,
            child: Stack(
              children: [
                Column(
                  children: [
                    //顶部记账天数、账本和搜索
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20, 14, 20, 114),
                      decoration: BoxDecoration(gradient: Styles.linearGradientYellowToRedForLight),
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
                                onTap: () {},
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
                    //收支列表
                    Container(
                      width: double.infinity,
                      height: constraints.maxHeight - 178 - MediaQuery.of(viewService.context).padding.top,
                      child: Stack(
                        children: <Widget>[
                          AnimationLimiter(
                            child: CustomScrollView(
                              controller: state.scrollController,
                              //统一滑动效果，同iOS越界回弹
                              physics: const BouncingScrollPhysics(),
                              slivers: List.generate(
                                state.titles.length,
                                (titleIndex) {
                                  String title = state.titles[titleIndex];
                                  List<String> dataList = state.data[title];
                                  return SliverList(
                                    delegate: SliverChildBuilderDelegate((ctx, cellIndex) {
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
                                          return AnimationConfiguration.staggeredList(
                                            position: cellIndex,
                                            duration: const Duration(milliseconds: 500),
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
                                          width: MediaQuery.of(context).size.width,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
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
      ),
    ),
  );
}
