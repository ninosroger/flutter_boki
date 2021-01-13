import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ChartAction {
  action,
  changePieIndex,
  changeChartType,
  changeDateType,
  changeChartShowStatus,
  showPieChart,
}

class ChartActionCreator {
  static Action onAction() {
    return const Action(ChartAction.action);
  }

  static Action onChangePieIndex(int index) {
    return Action(ChartAction.changePieIndex, payload: index);
  }

  static Action onChangeChartType() {
    return Action(ChartAction.changeChartType);
  }

  static Action onShowPieChart() {
    return Action(ChartAction.showPieChart);
  }

  static Action onChangeDateType(bool value) {
    return Action(ChartAction.changeDateType, payload: value);
  }

  static Action onChangeChartShowStatus(bool value) {
    return Action(ChartAction.changeChartShowStatus, payload: value);
  }
}
