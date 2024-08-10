import 'package:app/redux/stats/stats_actions.dart';
import 'package:app/redux/stats/stats_state.dart';

StatsState pickStatsTypeReducer(StatsState state, action){

  if (action == PickStatstypeAction){
    return state.copyWith(statsType: state.statsType);
  }
  return state;
}
StatsState addTimeToStatsReducer(StatsState state, action){

  if (action == AddTimeToStatsAction){
    return state.copyWith(
      statsType: state.statsType,
      elapsedTime: state.elapsedTime);
  }
  return state;
}