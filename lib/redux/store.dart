import 'package:app/redux/inspection/inpection_actions.dart';
import 'package:app/redux/inspection/inspection_reducers.dart';
import 'package:app/redux/inspection/inspection_state.dart';
import 'package:app/redux/timelist/timelist_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';


AppState appReducer(AppState state, dynamic action) {
  if (action is SetInspectionStateAction) {

    final nextInspectionState = inspectionReducer(state.inspectionState, action);

    return state.copyWith(inspectionState: nextInspectionState);
  }
  return state;
}


@immutable
class AppState {
  final InspectionState inspectionState;
  final TimeListState timelistState;

  const AppState({
    required this.inspectionState,
    required this.timelistState});

  
  AppState copyWith({
    InspectionState? inspectionState,
    TimeListState? timelistState}){
      return AppState(
        inspectionState: inspectionState ?? this.inspectionState, 
        timelistState: timelistState ?? this.timelistState);
    }
}

class Redux {
  static Store<AppState>? _store;
  static Store<AppState>? get store {
    if (_store == null ){
      throw Exception("store is not init");
    } else{
      return _store;
    }
  }

  static Future<void> init() async {
    final inspectionStateInitial = InspectionState.initial();
    final timeListStateInitial = TimeListState.initial();

    _store = Store<AppState>(appReducer, initialState: AppState(
      inspectionState: inspectionStateInitial, 
      timelistState: timeListStateInitial));
  }

}