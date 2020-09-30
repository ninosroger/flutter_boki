import 'package:fish_redux/fish_redux.dart';

class IndexState implements Cloneable<IndexState> {
  int selectedIndex = 0;

  @override
  IndexState clone() {
    return IndexState()..selectedIndex = selectedIndex;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState();
}
