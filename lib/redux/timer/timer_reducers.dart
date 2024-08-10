import 'package:app/redux/timer/timer_actions.dart';
import 'package:app/redux/timer/timer_state.dart';

CubeTimerState startCubeTimerReducer(CubeTimerState state, dynamic action){
  if (action is StartCubeTimerAction){
  
    return state.copyWith(isRunning: true, elapsedTime: state.elapsedTime);
  }
  return state;
}

CubeTimerState updateElapsedTimeReducer(CubeTimerState state, dynamic action){
  if (action is UpdateElapsedTimeAction){
    return state.copyWith(elapsedTime: action.elapsedTime, isRunning: true);
  }
  return state;
}

CubeTimerState stopCubeTimerReducer(CubeTimerState state, dynamic action){
  if(action is StopCubeTimerAction){
    return state.copyWith(elapsedTime: state.elapsedTime, isRunning: false);
  }
  return state;
}