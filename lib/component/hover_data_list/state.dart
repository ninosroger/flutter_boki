import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/global_store/state.dart';
import 'package:flutter_boki/resources/colors.dart';

import 'hover_header_vm.dart';
import 'hover_offset_info.dart';

class HoverDataListState implements GlobalBaseState, Cloneable<HoverDataListState> {
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
  HoverDataListState clone() {
    return HoverDataListState()
      ..themeColors = themeColors
      ..hoverVM = hoverVM
      ..scrollController = scrollController
      ..hoverOffsetInfoList = hoverOffsetInfoList
      ..hoverOffsetInfoIndex = hoverOffsetInfoIndex
      ..titles = titles
      ..data = data
      ..lastOffset = lastOffset;
  }

  @override
  ThemeColors themeColors;
}

HoverDataListState initState(Map<String, dynamic> args) {
  return HoverDataListState();
}
