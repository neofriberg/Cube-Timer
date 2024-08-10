
import 'package:flutter/material.dart';

@immutable
class CubeTimerState{

  final int elapsedTime;
  final bool isRunning;

  const CubeTimerState({required this.elapsedTime, required this.isRunning});
  
  factory CubeTimerState.initial(){
    return const CubeTimerState(
      elapsedTime: 0,
      isRunning: false
    );
  }

  CubeTimerState copyWith({
    required int elapsedTime,
    required bool isRunning,
  }){
    return CubeTimerState(
      elapsedTime: elapsedTime,
      isRunning: isRunning);
  }
}