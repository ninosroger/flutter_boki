import 'package:fish_redux/fish_redux.dart';

class IndexState implements Cloneable<IndexState> {

  @override
  IndexState clone() {
    return IndexState();
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState();
}
