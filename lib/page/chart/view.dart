import 'package:fish_redux/fish_redux.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boki/resources/dimens.dart';
import 'package:provider/provider.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ChartState state, Dispatch dispatch, ViewService viewService) {
  var pieRadius = 50.0;
  var pieFontSize = Dimens.font14;
  var pieTouchRadius = 60.0;
  var pieTouchFontSize = Dimens.font16;
  return ChangeNotifierProvider(
    create: (ctx) {
      return state.hoverVM;
    },
    child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (pieTouchResponse) {
                      if (pieTouchResponse.touchInput is FlLongPressEnd ||
                          pieTouchResponse.touchInput is FlPanEnd)
                        dispatch(ChartActionCreator.onChangePieIndex(-1));
                      else
                        dispatch(ChartActionCreator.onChangePieIndex(
                            pieTouchResponse.touchedSectionIndex));
                    },
                  ),
                  sections: [
                    PieChartSectionData(
                      value: 24.0,
                      showTitle: false,
                      radius:
                          state.touchPieIndex == 0 ? pieRadius : pieTouchRadius,
                      color: state.themeColors.chartGreen,
                    ),
                    PieChartSectionData(
                      value: 36.0,
                      showTitle: false,
                      color: state.themeColors.chartPink,
                    ),
                    PieChartSectionData(
                      value: 55.0,
                      showTitle: false,
                      color: state.themeColors.chartPurple,
                    ),
                    PieChartSectionData(
                      value: 70.0,
                      showTitle: false,
                      color: state.themeColors.chartBlue,
                    ),
                    PieChartSectionData(
                      value: 75.0,
                      showTitle: false,
                      color: state.themeColors.chartRed,
                    ),
                    PieChartSectionData(
                      value: 100.0,
                      showTitle: false,
                      color: state.themeColors.chartYellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
