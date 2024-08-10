import 'package:app/redux/inspection/inspection_actions.dart';
import 'package:app/redux/inspection/inspection_reducers.dart';
import 'package:app/redux/inspection/inspection_state.dart';
import 'package:app/redux/score_card_list/score_card_list_actions.dart';
import 'package:app/redux/score_card_list/score_card_list_reducers.dart';
import 'package:app/redux/score_card_list/score_card_list_state.dart';
import 'package:app/redux/timer/timer_actions.dart';
import 'package:app/redux/timer/timer_reducers.dart';
import 'package:app/redux/timer/timer_state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, dynamic action){
  if(action is InspectionTickAction){
    final nextInspectionTickState = 
      inspectionTickReducer(state.inspectionState, action);
    return state.copyWith(inspectionState: nextInspectionTickState);
  }
  if(action is InspectionChangeColorAction){
    final nextInspectionColorState = 
      inspectionChangeColorReducer(state.inspectionState, action);
      return state.copyWith(inspectionState: nextInspectionColorState);
  }
  if(action is InspectionStopAction){
    final nextInspectionStopState = 
      cancelInspectionReducer(state.inspectionState, action);
      return state.copyWith(inspectionState: nextInspectionStopState);
  }
  if(action is StartCubeTimerAction){
    final nextStartCubeTimerState =
      startCubeTimerReducer(state.cubeTimerState, action);
      return state.copyWith(cubeTimerState: nextStartCubeTimerState);
  }
  if (action is UpdateElapsedTimeAction){
    final nextUpdateElapsedTimeState =
      updateElapsedTimeReducer(state.cubeTimerState, action);
      return state.copyWith(cubeTimerState: nextUpdateElapsedTimeState);
  }
  if (action is AddTimeToScoreCardListAction){
    final nextScoreCardListState = 
      addTimeToScoreCardListReducer(state.scoreCardListState, action);
      return state.copyWith(scoreCardListState: nextScoreCardListState);
  }
  if (action is StartInspectionAction){
    final nextStartInspectionState =
      startInspectionReducer(state.inspectionState, action);
      return state.copyWith(inspectionState: nextStartInspectionState);
  }
  if(action is StopCubeTimerAction){
    final nextStopCubeTimerState =
      stopCubeTimerReducer(state.cubeTimerState, action);
      return state.copyWith(cubeTimerState: nextStopCubeTimerState);
  }
  if(action is InspectionButtonPressedOnAction){
    final nextInspectionButtonPressedState =
      inspectionButtonPressedOnReducer(state.inspectionState, action);
      return state.copyWith(inspectionState: nextInspectionButtonPressedState);
  }
  if(action is InspectionButtonPressedOnShortAction){
    final nextInspectionButtonPressedShort =
      inspectionButtonPressedOnShortReducer(state.inspectionState, action);
      return state.copyWith(inspectionState: nextInspectionButtonPressedShort);
  }
  if(action is InspectionButtonPressedOffShortAction){
    final nextInspecetionShortOffState = 
      inspectionButtonPressedShortOffReducer(state.inspectionState, action);
      return state.copyWith(inspectionState: nextInspecetionShortOffState);
  }
  if (action is InspectionButtonPressedOffAction){
    final nextInspectionButtonOffState = 
      inspectionButtonPressedOffReducer(state.inspectionState, action);
      return state.copyWith(inspectionState: nextInspectionButtonOffState);
  }
  if (action is ClearScoreCardListAction){
    final nextScoreCardListClearState = 
      clearScoreCardListReducer(state.scoreCardListState, action);
      return state.copyWith(scoreCardListState: nextScoreCardListClearState);
  }
  if (action is GetStatsTypeAction){
    final nextStatsTypeState =
      updateStatsTypeReducer(state.scoreCardListState, action);
      return state.copyWith(scoreCardListState: nextStatsTypeState);
  }
  if (action is AddToTimeListAction){
    final nextTimeListAction =
      addToTimeListReducer(state.scoreCardListState, action);
      return state.copyWith(scoreCardListState: nextTimeListAction);
  }
  if (action is ChangeScrambleAction){
    final nextScrambleState = 
      changeScrambleReducer(state.scoreCardListState, action);
      return state.copyWith(scoreCardListState: nextScrambleState);
  }
  return state;
}
class AppState{
  final InspectionState inspectionState;
  final CubeTimerState cubeTimerState;
  final ScorecardListState scoreCardListState;

  AppState({required this.scoreCardListState, required this.cubeTimerState, required this.inspectionState});

  AppState copyWith({
    InspectionState? inspectionState,
    CubeTimerState? cubeTimerState,
    ScorecardListState? scoreCardListState}){
    return AppState(
      inspectionState: inspectionState ?? this.inspectionState,
      cubeTimerState: cubeTimerState ?? this.cubeTimerState,
      scoreCardListState: scoreCardListState ?? this.scoreCardListState);
  }
}
class Redux {
  static Store<AppState>? _store;
  static Store<AppState>? get store{
    if (_store == null){
      throw Exception("store is not init");
    } else {
      return _store;
    }
  }

  static Future<void> init() async{
    final inspecetionStateInitial = InspectionState.initial();
    final cubeTimerStateInitial = CubeTimerState.initial();
    final scoreCardListStateInitital = ScorecardListState.initial();

    _store = Store<AppState>(
      appReducer, 
      initialState: AppState(
        inspectionState: inspecetionStateInitial,
        cubeTimerState: cubeTimerStateInitial,
        scoreCardListState: scoreCardListStateInitital));
  }

}