import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

@immutable
class TimeListState{
  final List<DateTime> timeList;
  const TimeListState({required this.timeList});

  factory TimeListState.initial() => const TimeListState(timeList: []);

  TimeListState copyWith({required List<DateTime> timeList}){
    return TimeListState(timeList: timeList);
  }
}
