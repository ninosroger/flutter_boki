import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'hover_offset_info.dart';
import 'state.dart';

Effect<HoverDataListState> buildEffect() {
  return combineEffects(<Object, Effect<HoverDataListState>>{
    HoverDataListAction.action: _onAction,
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<HoverDataListState> ctx) {
  ///列表
  ctx.state.titles = ctx.state.data.keys.toList();
  ctx.state.hoverOffsetInfoList.clear();
  double totalOffset = 0;

  ///第一段为收入支出wight
  double sectionStartOffset = totalOffset;
  double sectionOffset = 170;
  double startOffset = sectionOffset + totalOffset;
  double endOffset = startOffset;
  totalOffset += sectionOffset;
  ctx.state.hoverOffsetInfoList.add(
    HoverOffsetInfo(
      prevIndex: 0,
      index: ctx.state.titles.length > 1 ? 1 : 0,
      startOffset: startOffset,
      endOffset: endOffset,
      sectionStartOffset: sectionStartOffset,
    ),
  );
  for (var i = 1; i < ctx.state.titles.length; i++) {
    ///最后一段不需要计算
    if (i != ctx.state.titles.length - 1) {
      String element = ctx.state.titles[i];
      List<String> dataList = ctx.state.data[element];

      double sectionStartOffset = totalOffset;
      double sectionOffset = dataList.length * 64.0;
      double startOffset = sectionOffset + totalOffset;
      double endOffset = startOffset + 40.0;
      totalOffset += sectionOffset + 40.0;
      ctx.state.hoverOffsetInfoList.add(
        HoverOffsetInfo(
          prevIndex: i,
          index: i + 1,
          startOffset: startOffset,
          endOffset: endOffset,
          sectionStartOffset: sectionStartOffset,
        ),
      );
    }
  }

  ctx.state.scrollController.addListener(
        () {
      double offset = ctx.state.scrollController.offset;
      bool show = offset >= 0;
      if (ctx.state.hoverOffsetInfoIndex == 0) {
        ctx.state.hoverVM.show = false;
      } else if (ctx.state.hoverVM.show != show) {
        ctx.state.hoverVM.show = show;
      }
      bool upward = offset - ctx.state.lastOffset > 0;
      ctx.state.lastOffset = offset;

      HoverOffsetInfo offsetInfo;

      if (ctx.state.hoverOffsetInfoList.length >
          ctx.state.hoverOffsetInfoIndex) {
        offsetInfo =
        ctx.state.hoverOffsetInfoList[ctx.state.hoverOffsetInfoIndex];
        if (upward) {
          ///向上滚动
          if (offset < offsetInfo.startOffset) {
            /// [sectionStartOffset,startOffset)
            if (ctx.state.hoverVM.offset != 0) {
              ctx.state.hoverVM.update(offsetInfo.prevIndex, 0);
            }
          } else if (offset > offsetInfo.endOffset) {
            ///(endOffset
            ///超过endOffset，切换到下一个offsetInfo
            ctx.state.hoverOffsetInfoIndex++;
            if (ctx.state.hoverOffsetInfoIndex >=
                ctx.state.hoverOffsetInfoList.length) {
              ctx.state.hoverOffsetInfoIndex =
                  ctx.state.hoverOffsetInfoList.length - 1;
            }
            if (ctx.state.hoverOffsetInfoIndex == 1)
              // ctx.state.cardMoveController.forward();
            ctx.state.hoverVM.update(offsetInfo.index, 0);
          } else {
            /// [startOffset,endOffset]
            ctx.state.hoverVM
                .update(offsetInfo.prevIndex, offset - offsetInfo.startOffset);
          }
        } else {
          ///向下滚动
          if (offset >= offsetInfo.startOffset &&
              offset <= offsetInfo.endOffset) {
            ///[startOffset,endOffset]
            ctx.state.hoverVM
                .update(offsetInfo.prevIndex, offset - offsetInfo.startOffset);
          } else if (offset >= offsetInfo.sectionStartOffset) {
            ///[sectionStartOffset,startOffset）
            if (ctx.state.hoverVM.offset != 0) {
              ctx.state.hoverVM.update(offsetInfo.prevIndex, 0);
            }
          } else {
            /// sectionStartOffset)
            /// 切换到上一个offsetInfo
            ///其实就是offset小于上一个offsetInfo的endOffset的情况
            ctx.state.hoverOffsetInfoIndex--;
            if (ctx.state.hoverOffsetInfoIndex < 0) {
              ctx.state.hoverOffsetInfoIndex = 0;
            }
            if (ctx.state.hoverOffsetInfoIndex == 0)
              // ctx.state.smallMoveController.reverse();
            ctx.state.hoverVM.update(offsetInfo.prevIndex, 0);
          }
        }
      }
    },
  );
}

void _dispose(Action action, Context<HoverDataListState> ctx) {}

void _onAction(Action action, Context<HoverDataListState> ctx) {}
