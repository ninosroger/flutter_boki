import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boki/resources/styles.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(DrawerState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: state.themeColors.white,
    child: ListView(
      children: [
        Container(
          decoration: BoxDecoration(gradient: Styles.linearGradientTopYellowToBottomRedForLight),
          height: 200,
        )
      ],
    ),
  );
}
