import 'package:app/redux/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

@immutable
class InspectionViewModel{
  final int inspectionTime;
  final bool inspectionRunning;
  final Color inspectionColor;

  InspectionViewModel({required this.inspectionTime, required this.inspectionRunning, required this.inspectionColor});

  static InspectionViewModel from(Store<AppState> store){
    return InspectionViewModel(
      inspectionTime: store.state.inspectionState.inspectionTime, 
      inspectionRunning: store.state.inspectionState.inspectionRunning, 
      inspectionColor: store.state.inspectionState.inspectionColor);
  } 
}