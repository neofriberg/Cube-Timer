import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

@immutable
class TimeState{
  final String time;
  final bool isDNF;
  final bool isPlusTwo;

  TimeState({required this.time, required this.isDNF, required this.isPlusTwo});

  factory TimeState.initial(){
    return TimeState(
      time: "", 
      isDNF: false, 
      isPlusTwo: false);
  }

  TimeState copyWith({
    required String time,
    required bool isDNF,
    required bool isPlusTwo
  }){
    return TimeState(
      time: time, 
      isDNF: isDNF, 
      isPlusTwo: isPlusTwo);
  }
}