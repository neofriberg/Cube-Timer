import 'package:app/Viewmodels/score_card_view_model.dart';
import 'package:app/redux/score_card_list/score_card_list_actions.dart';
import 'package:app/redux/score_card_list/score_card_list_state.dart';

ScorecardListState addTimeToScoreCardListReducer(ScorecardListState state, dynamic action){

  if (action is AddTimeToScoreCardListAction){
    if(List<String>.from(state.scoreCardList).length < 5){
        final newList = List<String>.from(state.scoreCardList)..add(action.time);
      
    return state.copyWith(
      scoreCardList: newList,
      statsType: state.statsType,
      elapsedTimePerSolve: state.elapsedTimePerSolve,
      worstPossibleAverage: state.worstPossibleAverage,
      scramble: state.scramble
    );
    }
  }
  return state;
}

ScorecardListState clearScoreCardListReducer(ScorecardListState state, dynamic action){

  if(action is ClearScoreCardListAction){
    return state.copyWith(
      scoreCardList: [],
      statsType: state.statsType,
      elapsedTimePerSolve: state.elapsedTimePerSolve,
      worstPossibleAverage: state.worstPossibleAverage,
      scramble: state.scramble
    );
  }
  return state;
}

ScorecardListState updateStatsTypeReducer(ScorecardListState state, action){


  if (action is GetStatsTypeAction){

    String newStatsType = getStatsType(state);
    return state.copyWith(
      scoreCardList: state.scoreCardList, 
      statsType: newStatsType, 
      elapsedTimePerSolve: state.elapsedTimePerSolve,
      worstPossibleAverage: state.scoreCardList.length == 4 ? "WPA" : state.worstPossibleAverage,
      scramble: state.scramble
      );
  }
  return state;
}

ScorecardListState addToTimeListReducer(ScorecardListState state, action){
  if (action is AddToTimeListAction){

    var newlist = List<int>.from(state.elapsedTimePerSolve)..add(action.time);

    return state.copyWith(
      scoreCardList: state.scoreCardList, 
      statsType: state.statsType, 
      elapsedTimePerSolve: newlist, 
      worstPossibleAverage: state.worstPossibleAverage,
      scramble: state.scramble);
  }
  return state;
}

String getStatsType(ScorecardListState state){
  if(state.scoreCardList.length == 4){
   return "BPA";
  }  else if (state.scoreCardList.length == 5){
    return "AO5";
  } else {
    return "";
  }
}

ScorecardListState changeScrambleReducer(ScorecardListState state, action){
  if (action is ChangeScrambleAction){
    return state.copyWith(
      scoreCardList: state.scoreCardList, 
      statsType: state.statsType, 
      elapsedTimePerSolve: state.elapsedTimePerSolve, 
      worstPossibleAverage: state.worstPossibleAverage, 
      scramble: action.scramble);
  }
  return state;
}