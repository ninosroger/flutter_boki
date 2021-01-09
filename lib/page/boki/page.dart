import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BokiPage extends Page<BokiState, Map<String, dynamic>> {
  BokiPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BokiState>(
                adapter: null,
                slots: <String, Dependent<BokiState>>{
                }),
            middleware: <Middleware<BokiState>>[
            ],);

}
