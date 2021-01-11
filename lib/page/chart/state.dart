import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/page/home/hover_header_vm.dart';
import 'package:flutter_boki/page/home/hover_offset_info.dart';
import 'package:flutter_boki/resources/colors.dart';

class ChartState implements GlobalBaseState, Cloneable<ChartState> {
  int touchPieIndex = 0;

  HoverHeaderVM hoverVM = HoverHeaderVM();
  ScrollController scrollController = ScrollController();
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
      ..touchPieIndex = touchPieIndex
      ..hoverVM = hoverVM
      ..scrollController = scrollController
      ..hoverOffsetInfoList = hoverOffsetInfoList
      ..hoverOffsetInfoIndex = hoverOffsetInfoIndex
      ..titles = titles
      ..lastOffset = lastOffset
      ..data = data;
  }

  @override
  ThemeColors themeColors;
}

ChartState initState(Map<String, dynamic> args) {
  return ChartState();
}
