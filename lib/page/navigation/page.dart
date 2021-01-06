import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NavigationPage extends Page<NavigationState, Map<String, dynamic>> {
  NavigationPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NavigationState>(
                adapter: null,
                slots: <String, Dependent<NavigationState>>{
                }),
            middleware: <Middleware<NavigationState>>[
            ],);

}
