import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BokiState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: state.themeColors.chartPurple,
  );
}
