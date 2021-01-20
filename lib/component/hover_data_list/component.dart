import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'hover_component.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HoverDataListComponent extends Component<HoverDataListState> {
  HoverDataListComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HoverDataListState>(adapter: null, slots: <String, Dependent<HoverDataListState>>{}),
        );

  @override
  ComponentState<HoverDataListState> createState() => HoverComponentState();
}
