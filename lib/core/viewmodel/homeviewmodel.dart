import 'package:flutter/foundation.dart';
import 'package:musically/core/enum/view_state.dart';

import '../../SampleData.dart';
import 'base_model.dart';

class HomeModel extends BaseModel {
  Data _data = Data();

  Data get data => _data;

  set data(Data value) {
    state = ViewState.Busy;
    _data = value;
    state = ViewState.Idle;
  }
}
