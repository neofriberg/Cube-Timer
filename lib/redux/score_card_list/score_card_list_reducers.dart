import 'package:app/redux/score_card_list/score_card_list_actions.dart';
import 'package:app/redux/score_card_list/score_card_list_state.dart';

ScorecardListState addTimeToScoreCardListReducer(ScorecardListState state, dynamic action){

  if (action is AddTimeToScoreCardListAction){
    if(List<String>.from(state.scoreCardList).length < 5){
        final newList = List<String>.from(state.scoreCardList)..add(action.time);
      
    return state.copyWith(scoreCardList: newList);
    }
  }
  return state;
}