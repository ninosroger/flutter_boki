import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DrawerComponent extends Component<DrawerState> {
  DrawerComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DrawerState>(
                adapter: null,
                slots: <String, Dependent<DrawerState>>{
                }),);

}
