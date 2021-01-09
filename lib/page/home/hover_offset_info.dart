import 'package:flutter/material.dart';

///列表信息
class HoverOffsetInfo {
  int prevIndex;
  int index;
  double startOffset;
  double endOffset;
  double sectionStartOffset;

  HoverOffsetInfo(
      {@required this.prevIndex,
      @required this.index,
      @required this.startOffset,
      @required this.endOffset,
      @required this.sectionStartOffset});

  @override
  String toString() {
    return 'HoverOffsetInfo{prevTitle: $prevIndex, title: $index, startOffset: $startOffset, endOffset: $endOffset}';
  }
}
