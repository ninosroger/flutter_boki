import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/page/home/hover_header_vm.dart';
import 'package:flutter_boki/page/home/hover_offset_info.dart';
import 'package:flutter_boki/resources/colors.dart';

class ChartState implements GlobalBaseState, Cloneable<ChartState> {
  List<String> tabs = ["支出", "收入"];
  TabController tabController;

  int touchPieIndex = -1;
  var isPieChart = true;
  var isMonthBtnSelect = true;
  var hasHideChart = false;
  var isShowPieChart = false;

  HoverHeaderVM hoverVM = HoverHeaderVM();
  ScrollController incomeScrollController = ScrollController();
  ScrollController expensesScrollController = ScrollController();
  List<HoverOffsetInfo> hoverOffsetInfoList = [];
  int hoverOffsetInfoIndex = 0;
  List titles = [];
  double lastOffset = 0;

  Map<String, List<String>> data = {
    "": [""],
    "2020": ["1", "2", "3"],
    "2021": ["1", "2", "3", "4", "5"],
    "2022": ["1", "2", "3", "4", "5", "6"],
    "2023": ["1", "2"],
    "2024": ["1", "2", "3", "4", "5"],
    "2025": ["1", "2", "3", "4", "5", "6"],
    "2026": ["1", "2", "3"],
    "2027": ["1", "2", "3", "4"],
    "2028": ["1", "2"],
    "2029": ["1", "2", "3", "4", "5", "6", "7"],
  };

  @override
  ChartState clone() {
    return ChartState()
      ..themeColors = themeColors
      ..isPieChart = isPieChart
      ..incomeScrollController = incomeScrollController
      ..expensesScrollController = expensesScrollController
      ..isMonthBtnSelect = isMonthBtnSelect
      ..touchPieIndex = touchPieIndex
      ..hoverVM = hoverVM
      ..hoverOffsetInfoList = hoverOffsetInfoList
      ..hoverOffsetInfoIndex = hoverOffsetInfoIndex
      ..titles = titles
      ..lastOffset = lastOffset
      ..tabs = tabs
      ..tabController = tabController
      ..hasHideChart = hasHideChart
      ..isShowPieChart = isShowPieChart
      ..data = data;
  }

  @override
  ThemeColors themeColors;
}

ChartState initState(Map<String, dynamic> args) {
  var state = ChartState();
  return state;
}
