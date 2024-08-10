import 'package:app/models/scorecard_list.dart';
import 'package:flutter/material.dart';

@immutable
class StatsState{
  final String statsType;
  final ScorecardList? scorecardList;
  final int? elapsedTime;


  const StatsState({required this.statsType, this.scorecardList, this.elapsedTime});

  factory StatsState.initial(){
    return const StatsState(statsType: "");
  }


  StatsState copyWith({
    required String statsType,
    ScorecardList? scorecardList,
    int? elapsedTime


  }){
    return StatsState(
      statsType: statsType,
      scorecardList: scorecardList,
      elapsedTime: elapsedTime
      );
  }

}