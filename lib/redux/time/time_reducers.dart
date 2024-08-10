import 'package:app/redux/time/time_actions.dart';
import 'package:app/redux/time/time_state.dart';

TimeState updateTimeReducer(TimeState state, dynamic action){
  
  if (action == UpdateTimeAction){
    return state.copyWith(
      time: action.time, 
      isDNF: state.isDNF, 
      isPlusTwo: state.isPlusTwo);
  }
  return state;
}
TimeState removeTimeReducer(TimeState state, dynamic action){
  
  if (action == RemoveTimeAction){
    return state.copyWith(
      time: state.time, 
      isDNF: state.isDNF, 
      isPlusTwo: state.isPlusTwo);
  }
  return state;
}
TimeState makePlusTwoReducer(TimeState state, dynamic action){
  
  if (action == MakePlusTwoAction){
    return state.copyWith(
      time: state.time, 
      isDNF: state.isDNF, 
      isPlusTwo: true);
  }
  return state;
}
TimeState makeDNFReducer(TimeState state, dynamic action){
  
  if (action == MakeDNFAction){
    return state.copyWith(
      time: state.time, 
      isDNF: true, 
      isPlusTwo: state.isPlusTwo);
  }
  return state;
}
TimeState undoReducer(TimeState state, dynamic action){
  
  if (action == UndoAction){
    return state.copyWith(
      time: state.time, 
      isDNF: false, 
      isPlusTwo: false);
  }
  return state;
}