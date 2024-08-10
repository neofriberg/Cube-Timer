// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class InspectionState{
  final int inspectionTime;
  final bool inspectionRunning;
  final Timer? timer;
  final Color inspectionColor;
  final bool inspectionButtonPressed;
  final bool inspectionButtonPressedShort;

  InspectionState({
    required this.inspectionButtonPressedShort,
    required this.inspectionTime, 
    required this.inspectionRunning, 
    this.timer, 
    required this.inspectionColor,
    required this.inspectionButtonPressed});

  factory InspectionState.initial(){
    return InspectionState(
      inspectionTime: 15, 
      inspectionRunning: false, 
      inspectionColor: Colors.black,
      inspectionButtonPressed: true,
      inspectionButtonPressedShort: false);
  }

  InspectionState copyWith({
    required int inspectionTime,
    required bool inspectionRunning,
    Timer? timer,
    required Color inspectionColor,
    required bool inspectionButtonPressed,
    required bool inspectionButtonPressedShort
  }){
    return InspectionState(
      inspectionTime: inspectionTime, 
      inspectionRunning: inspectionRunning,
      timer: timer ?? this.timer,
      inspectionColor: inspectionColor,
      inspectionButtonPressed: inspectionButtonPressed,
      inspectionButtonPressedShort: inspectionButtonPressedShort);
  }
}