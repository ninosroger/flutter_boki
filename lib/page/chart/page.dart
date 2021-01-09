import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ChartPage extends Page<ChartState, Map<String, dynamic>> {
  ChartPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ChartState>(
                adapter: null,
                slots: <String, Dependent<ChartState>>{
                }),
            middleware: <Middleware<ChartState>>[
            ],);

}
