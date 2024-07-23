import 'package:flutter/cupertino.dart';

@immutable
class InspectionState{
  final int inspectionTime;

  const InspectionState({required this.inspectionTime});

  factory InspectionState.initial() => const InspectionState(inspectionTime: 15);

  InspectionState copyWith({required int inspectionState}){
    return InspectionState(inspectionTime: inspectionTime);
  }
}