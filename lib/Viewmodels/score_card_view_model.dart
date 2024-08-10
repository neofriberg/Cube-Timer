import 'package:app/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class ScoreCardViewModel{
  final List<String> scoreCardList;

  ScoreCardViewModel({required this.scoreCardList});

  static ScoreCardViewModel from(Store<AppState> store){
    return ScoreCardViewModel(
      scoreCardList: store.state.scoreCardListState.scoreCardList); 
  }  
}