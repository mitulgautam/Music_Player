import 'package:flutter/foundation.dart';
import 'package:flutter_musically_app/core/enum/view_state.dart';
class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.Busy;

  ViewState get state => _state;

  set state(ViewState viewState) {
    _state = viewState;
    notifyListeners();
    print(_state);
  }
}
