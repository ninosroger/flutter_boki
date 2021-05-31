import 'package:fish_redux/fish_redux.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/page/home/hover_header_vm.dart';
import 'package:flutter_boki/resources/res.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ChartState state, Dispatch dispatch, ViewService viewService) {
  var pieRadius = 45.0;
  var pieTouchRadius = 54.0;

  var incomeExpenditureView = Column(
    children: [
      Container(
        height: 270,
        color: state.themeColors.white,
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
            fontSize: 11,
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
            fontSize: 11,
            color: state.themeColors.gray,
          ),
        ),
        Gaps.hSpace10,
        Text(
          '支出：650',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11,
            color: state.themeColors.gray,
          ),
        ),
      ],
    ),
  );
  var incomeExpenditureCell = SlideAnimation(
    verticalOffset: 200.0,
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
                          fontSize: 14,
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
                          fontSize: 16,
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
      child: Scaffold(
        body: Container(
          child: Container(
            color: state.themeColors.white,
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Column(
                    children: [
                      //顶部tab、图表icon
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 14, 20, 90),
                        decoration: BoxDecoration(gradient: Styles.linearGradientYellowToRedForLight),
                        child: SafeArea(
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TabBar(
                                  tabs: state.tabs.map((e) => Text(e)).toList(),
                                  isScrollable: true,
                                  controller: state.tabController,
                                  indicatorColor: state.themeColors.white,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  unselectedLabelColor: state.themeColors.lightGray,
                                  labelColor: state.themeColors.white,
                                  labelPadding: EdgeInsets.fromLTRB(14, 6, 14, 6),
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                                ),
                                Expanded(
                                  child: Gaps.hSpace10,
                                ),
                                InkWell(
                                  onTap: () {
                                    dispatch(ChartActionCreator.onChangeChartType());
                                  },
                                  child: state.isPieChart
                                      ? ImageIcon(
                                          AssetImage('assets/images/pie_chart.png'),
                                          color: state.themeColors.white,
                                          size: 28.0,
                                        )
                                      : ImageIcon(
                                          AssetImage('assets/images/line_chart.png'),
                                          color: state.themeColors.white,
                                          size: 28.0,
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
                        height: constraints.maxHeight - 154 - MediaQuery.of(viewService.context).padding.top,
                        child: TabBarView(
                            //统一滑动效果，同iOS越界回弹
                            physics: const PageScrollPhysics(parent: const BouncingScrollPhysics()),
                            children: [
                              Stack(
                                children: <Widget>[
                                  AnimationLimiter(
                                    child: CustomScrollView(
                                      controller: state.incomeScrollController,
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
                                                  width: MediaQuery.of(viewService.context).size.width,
                                                  color: state.themeColors.white,
                                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '5月13日 星期日',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 11,
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
                                                          fontSize: 11,
                                                          color: state.themeColors.gray,
                                                        ),
                                                      ),
                                                      Gaps.hSpace10,
                                                      Text(
                                                        '支出：650',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 11,
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
                              Stack(
                                children: <Widget>[
                                  AnimationLimiter(
                                    child: CustomScrollView(
                                      controller: state.expensesScrollController,
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
                                                  width: MediaQuery.of(viewService.context).size.width,
                                                  color: state.themeColors.white,
                                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '5月13日 星期日',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 11,
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
                                                          fontSize: 11,
                                                          color: state.themeColors.gray,
                                                        ),
                                                      ),
                                                      Gaps.hSpace10,
                                                      Text(
                                                        '支出：650',
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 11,
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
                            ],
                            controller: state.tabController),
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: AnimatedContainer(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    width: double.infinity,
                    height: state.hasHideChart ? 130.0 : 330.0,
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
                            Row(
                              children: [
                                Text(
                                  '5月',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
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
                            Expanded(child: Gaps.hSpace10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    dispatch(ChartActionCreator.onChangeDateType(true));
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    width: 60,
                                    height: 32,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: state.isMonthBtnSelect ? Styles.linearGradientYellowToRedForLight : Styles.linearGradientGrayForLight,
                                      borderRadius: BorderRadius.circular(17),
                                      boxShadow: [
                                        BoxShadow(
                                          color: state.isMonthBtnSelect ? state.themeColors.gray : state.themeColors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 4.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      '月',
                                      style: TextStyle(
                                        color: state.isMonthBtnSelect ? state.themeColors.white : state.themeColors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                Gaps.hSpace10,
                                GestureDetector(
                                  onTap: () {
                                    dispatch(ChartActionCreator.onChangeDateType(false));
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    width: 60,
                                    height: 32,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: !state.isMonthBtnSelect ? Styles.linearGradientYellowToRedForLight : Styles.linearGradientGrayForLight,
                                      borderRadius: BorderRadius.circular(17),
                                      boxShadow: [
                                        BoxShadow(
                                          color: !state.isMonthBtnSelect ? state.themeColors.gray : state.themeColors.white,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 4.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      '年',
                                      style: TextStyle(
                                        color: !state.isMonthBtnSelect ? state.themeColors.white : state.themeColors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              mainAxisSize: MainAxisSize.min,
                            )
                          ],
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          height: state.hasHideChart ? 0 : 200,
                          curve: Curves.fastOutSlowIn,
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                          child: Row(
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: PieChart(
                                  PieChartData(
                                    borderData: FlBorderData(show: false),
                                    centerSpaceRadius: 40.0,
                                    sectionsSpace: 2.0,
                                    pieTouchData: PieTouchData(
                                      touchCallback: (pieTouchResponse) {
                                        if (pieTouchResponse.touchInput is FlPanStart) dispatch(ChartActionCreator.onChangePieIndex(pieTouchResponse.touchedSectionIndex));
                                      },
                                    ),
                                    sections: [
                                      PieChartSectionData(
                                        value: state.isShowPieChart ? 24.0 : 0.0,
                                        showTitle: false,
                                        radius: state.touchPieIndex == 0 ? pieTouchRadius : pieRadius,
                                        color: state.themeColors.chartGreen,
                                      ),
                                      PieChartSectionData(
                                        value: state.isShowPieChart ? 36.0 : 0.0,
                                        showTitle: false,
                                        radius: state.touchPieIndex == 1 ? pieTouchRadius : pieRadius,
                                        color: state.themeColors.chartPink,
                                      ),
                                      PieChartSectionData(
                                        value: state.isShowPieChart ? 55.0 : 0.0,
                                        showTitle: false,
                                        radius: state.touchPieIndex == 2 ? pieTouchRadius : pieRadius,
                                        color: state.themeColors.chartPurple,
                                      ),
                                      PieChartSectionData(
                                        value: state.isShowPieChart ? 70.0 : 0.0,
                                        showTitle: false,
                                        radius: state.touchPieIndex == 3 ? pieTouchRadius : pieRadius,
                                        color: state.themeColors.chartBlue,
                                      ),
                                      PieChartSectionData(
                                        value: state.isShowPieChart ? 75.0 : 0.0,
                                        showTitle: false,
                                        radius: state.touchPieIndex == 4 ? pieTouchRadius : pieRadius,
                                        color: state.themeColors.chartRed,
                                      ),
                                      PieChartSectionData(
                                        value: state.isShowPieChart ? 100.0 : 0.0,
                                        showTitle: false,
                                        radius: state.touchPieIndex == 5 ? pieTouchRadius : pieRadius,
                                        color: state.themeColors.chartYellow,
                                      ),
                                      PieChartSectionData(
                                        value: state.isShowPieChart ? 0.0 : 360.0,
                                        showTitle: false,
                                        radius: state.touchPieIndex == 6 ? pieTouchRadius : pieRadius,
                                        color: state.themeColors.white,
                                      ),
                                    ],
                                  ),
                                  swapAnimationDuration: Duration(milliseconds: 400),
                                ),
                              ),
                              Container(
                                height: 200,
                                padding: EdgeInsets.fromLTRB(16, 10, 10, 10),
                                width: MediaQuery.of(viewService.context).size.width - 268,
                                child: ListView(
                                  //统一滑动效果，同iOS越界回弹
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    Container(
                                      height: 30,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FontAwesome.circle,
                                            size: 12,
                                            color: state.themeColors.chartGreen,
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '饮食',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.black,
                                            ),
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '48%',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FontAwesome.circle,
                                            size: 12,
                                            color: state.themeColors.chartPink,
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '出行',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '24%',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FontAwesome.circle,
                                            size: 12,
                                            color: state.themeColors.chartPurple,
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '蔬菜',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '12%',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FontAwesome.circle,
                                            size: 12,
                                            color: state.themeColors.chartBlue,
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '零食',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '9%',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FontAwesome.circle,
                                            size: 12,
                                            color: state.themeColors.chartRed,
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '购物',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '17%',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FontAwesome.circle,
                                            size: 12,
                                            color: state.themeColors.chartYellow,
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '游玩',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                          Gaps.hSpace10,
                                          Text(
                                            '22%',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: state.themeColors.gray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 65,
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
                                          '总支出',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: state.themeColors.gray,
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
                                        fontSize: 18,
                                        color: state.themeColors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                color: state.themeColors.lightGray,
                                width: 0.6,
                                indent: 22,
                                endIndent: 22,
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
                                          '平均支出',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: state.themeColors.gray,
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
                                        fontSize: 18,
                                        color: state.themeColors.red,
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
