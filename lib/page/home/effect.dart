import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'hover_offset_info.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _init,
    Lifecycle.dispose: _dispose,
  });
}

void _init(Action action, Context<HomeState> ctx) {
  ///动效
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;

  //淡入淡出
  ctx.state.topController = AnimationController(
      duration: Duration(milliseconds: 800), vsync: tickerProvider)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ctx.state.topStatus = true;
      } else if (status == AnimationStatus.dismissed) {
        ctx.state.topStatus = false;
      }
    });
  ctx.state.topAnimation =
      Tween<double>(begin: 0, end: 1).animate(ctx.state.topController);

  //位移
  ctx.state.cardMoveController = AnimationController(
      duration: Duration(milliseconds: 600), vsync: tickerProvider)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ctx.state.cardMoveStatus = true;
        ctx.state.smallMoveController.forward();
        ctx.state.topController.forward();
      } else if (status == AnimationStatus.dismissed) {
        ctx.state.cardMoveStatus = false;
      }
    });
  ctx.state.cardMoveAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(-1.2, 0)).animate(
    CurvedAnimation(
      parent: ctx.state.cardMoveController,
      curve: Curves.easeInOutBack,
    ),
  );

  //位移
  ctx.state.smallMoveController = AnimationController(
      duration: Duration(milliseconds: 400), vsync: tickerProvider)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ctx.state.smallMoveStatus = true;
        ctx.state.topController.forward();
      } else if (status == AnimationStatus.dismissed) {
        ctx.state.smallMoveStatus = false;
        ctx.state.cardMoveController.reverse();
        ctx.state.topController.reverse();
      }
    });
  ctx.state.smallMoveAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 0)).animate(
    CurvedAnimation(
      parent: ctx.state.smallMoveController,
      curve: Curves.easeInOutBack,
    ),
  );

  ctx.state.cellMoveController = AnimationController(
      duration: Duration(milliseconds: 400), vsync: tickerProvider);
  ctx.state.cellMoveAnimation =
      Tween<Offset>(begin: Offset(1.5, 0), end: Offset.zero).animate(
    CurvedAnimation(
      parent: ctx.state.cellMoveController,
      curve: Curves.easeIn,
    ),
  );
  ctx.state.cellMoveController.forward();

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
              ctx.state.cardMoveController.forward();
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
              ctx.state.smallMoveController.reverse();
            ctx.state.hoverVM.update(offsetInfo.prevIndex, 0);
          }
        }
      }
    },
  );
}

void _dispose(Action action, Context<HomeState> ctx) {
  ctx.state.topController.dispose();
  ctx.state.scrollController.dispose();
  ctx.state.smallMoveController.dispose();
  ctx.state.cardMoveController.dispose();
}

void _onAction(Action action, Context<HomeState> ctx) {}
