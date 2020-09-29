import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class OwnPage extends Page<OwnState, Map<String, dynamic>> {
  OwnPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<OwnState>(
                adapter: null,
                slots: <String, Dependent<OwnState>>{
                }),
            middleware: <Middleware<OwnState>>[
            ],);

}
