
import 'package:app/redux/inspection/inspection_actions.dart';
import 'package:app/redux/inspection/inspection_state.dart';
import 'package:flutter/material.dart';


InspectionState inspectionTickReducer(InspectionState state, dynamic action){

  if(action is InspectionTickAction){

    return state.copyWith(
      inspectionTime: (state.inspectionTime > 0) ? state.inspectionTime - 1 : 15, 
      inspectionRunning: true,
      inspectionColor: state.inspectionColor,
      inspectionButtonPressed: state.inspectionButtonPressed,
      inspectionButtonPressedShort: state.inspectionButtonPressedShort);
       
  }
  return state;
}

InspectionState startInspectionReducer(InspectionState state, dynamic action){
  if (action is StartInspectionAction){
    return(state.copyWith(
      inspectionTime: state.inspectionTime, 
      inspectionRunning: true, 
      inspectionColor: state.inspectionColor,
      inspectionButtonPressed: state.inspectionButtonPressed,
      inspectionButtonPressedShort: state.inspectionButtonPressedShort));
  }
  return state;
}

InspectionState inspectionChangeColorReducer(InspectionState state, dynamic action){
  if (action is InspectionChangeColorAction){
    var color = determineColor(state.inspectionTime, state.inspectionButtonPressed, state.inspectionButtonPressedShort);
    return state.copyWith(
      inspectionTime: state.inspectionTime, 
      inspectionRunning: state.inspectionRunning, 
      inspectionColor: color,
      inspectionButtonPressed: state.inspectionButtonPressed,
      inspectionButtonPressedShort: state.inspectionButtonPressedShort);
  }
  return state;
}

InspectionState cancelInspectionReducer(InspectionState state, dynamic action){
  if (action is InspectionStopAction){

    return state.copyWith(
      inspectionTime: 15, 
      inspectionRunning: false, 
      inspectionColor: state.inspectionColor,
      inspectionButtonPressed: state.inspectionButtonPressed,
      inspectionButtonPressedShort: state.inspectionButtonPressedShort);
  }
  return state;
}

InspectionState inspectionButtonPressedOnReducer(InspectionState state, dynamic action){
  if (action is InspectionButtonPressedOnAction){
    return state.copyWith(
      inspectionTime: state.inspectionTime, 
      inspectionRunning: state.inspectionRunning, 
      inspectionColor: state.inspectionColor, 
      inspectionButtonPressed: false,
      inspectionButtonPressedShort: state.inspectionButtonPressedShort);
  }
  return state;
}

InspectionState inspectionButtonPressedOnShortReducer(InspectionState state, dynamic action){
  if (action is InspectionButtonPressedOnShortAction){

    return state.copyWith(
      inspectionTime: state.inspectionTime, 
      inspectionRunning: state.inspectionRunning, 
      inspectionColor: state.inspectionColor, 
      inspectionButtonPressed: state.inspectionButtonPressed, 
      inspectionButtonPressedShort: true);
  } return state;
}

InspectionState inspectionButtonPressedOffReducer(InspectionState state, dynamic action){
  if(action is InspectionButtonPressedOffAction){
    return state.copyWith(
      inspectionTime: state.inspectionTime, 
      inspectionRunning: state.inspectionRunning, 
      inspectionColor: state.inspectionColor, 
      inspectionButtonPressed: true, 
      inspectionButtonPressedShort: state.inspectionButtonPressedShort);
  }return state;
}

InspectionState inspectionButtonPressedShortOffReducer(InspectionState state, dynamic action){
  if(action is InspectionButtonPressedOffShortAction){

    return state.copyWith(
      inspectionTime: state.inspectionTime, 
      inspectionRunning: state.inspectionRunning, 
      inspectionColor: state.inspectionColor, 
      inspectionButtonPressed: state.inspectionButtonPressed, 
      inspectionButtonPressedShort: state.inspectionButtonPressedShort);
  }return state;
}
  Color determineColor(int inspectionTime, bool buttonPressed, bool buttonPressedShort){

    if (buttonPressed){

    if(inspectionTime > 3 && inspectionTime < 8){
      return Colors.yellow;
    }else if(inspectionTime < 4){
      return Colors.orange;
    }else if(buttonPressedShort){
      return Colors.red;
    }
    else{
      return Colors.black;
    }
  } else{
    return Colors.green;
  }
    
}