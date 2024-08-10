import 'package:flutter/material.dart';

@immutable
class ScorecardListState{
  final List<String> scoreCardList;

  const ScorecardListState({required this.scoreCardList});

  factory ScorecardListState.initial(){
    return const ScorecardListState(scoreCardList: []);
  }

  ScorecardListState copyWith({
    required List<String> scoreCardList
  }){
    return ScorecardListState(
      scoreCardList: scoreCardList);
  }
}