import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/common/global_field.dart';
import 'package:flutter_boki/page/home/state.dart';

class HomeComponentState extends ComponentState<HomeState> with TickerProviderStateMixin {
  @override
  void dispose() {
    GlobalField.bus.emit("dispose_from_ticker");
    super.dispose();
  }
}

class HomeComponent extends Component<HomeState> {
  @override
  HomeComponentState createState() => HomeComponentState();
}
