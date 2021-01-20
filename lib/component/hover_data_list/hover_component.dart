import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

class HoverComponentState extends ComponentState<HoverDataListState> with TickerProviderStateMixin {}

class HomeComponent extends Component<HoverDataListState> {
  @override
  HoverComponentState createState() => HoverComponentState();
}
