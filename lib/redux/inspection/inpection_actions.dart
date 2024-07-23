import 'package:app/redux/inspection/inspection_state.dart';
import 'package:app/redux/store.dart';
import 'package:flutter/cupertino.dart';
// ignore: implementation_imports
import 'package:redux/src/store.dart';

@immutable
class SetInspectionStateAction {
  final InspectionState inspectionState;
  const SetInspectionStateAction(this.inspectionState);
}

void updateInspectionTime (Store<AppState> store, int inspectionTime){
  var newInspectionTime = inspectionTime - 1;
  store.dispatch(
    SetInspectionStateAction(
      InspectionState(inspectionTime: newInspectionTime)
    )
  );
}