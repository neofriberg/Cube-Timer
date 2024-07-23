import 'package:app/redux/timelist/timelist_state.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SetTimeListStateAction {
  final TimeListState timeListState;

  const SetTimeListStateAction(this.timeListState);
}
