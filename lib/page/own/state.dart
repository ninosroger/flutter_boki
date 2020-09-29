import 'package:fish_redux/fish_redux.dart';

class OwnState implements Cloneable<OwnState> {

  @override
  OwnState clone() {
    return OwnState();
  }
}

OwnState initState(Map<String, dynamic> args) {
  return OwnState();
}
