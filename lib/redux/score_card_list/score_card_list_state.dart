import 'package:flutter/material.dart';

@immutable
class ScorecardListState{
  final List<String> scoreCardList;
  final String statsType;
  final String worstPossibleAverage;
  final List<int> elapsedTimePerSolve;
  final String scramble;

  const ScorecardListState({
    required this.scoreCardList, 
    required this.statsType, 
    required this.elapsedTimePerSolve, 
    required this.worstPossibleAverage,
    required this.scramble});

  factory ScorecardListState.initial(){
    return const ScorecardListState(
      scoreCardList: [],
      statsType: "",
      elapsedTimePerSolve: [],
      worstPossibleAverage: "",
      scramble: "");
  }

  ScorecardListState copyWith({
    required List<String> scoreCardList,
    required String statsType,
    required List<int> elapsedTimePerSolve,
    required String worstPossibleAverage,
    required String scramble
  }){
    return ScorecardListState(
      scoreCardList: scoreCardList,
      statsType: statsType,
      elapsedTimePerSolve: elapsedTimePerSolve,
      worstPossibleAverage: worstPossibleAverage,
      scramble: scramble);
  }
}