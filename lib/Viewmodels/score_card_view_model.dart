import 'package:app/redux/store.dart';
import 'package:redux/redux.dart';

class ScoreCardViewModel{
  final List<String> scoreCardList;
  final String statsType;
  final String worstPossibleAverage;
  final List<int> elapsedTimePerSolve;
  final String scramble;

  ScoreCardViewModel({
    required this.scoreCardList, 
    required this.statsType, 
    required this.worstPossibleAverage,
    required this.elapsedTimePerSolve,
    required this.scramble});

  static ScoreCardViewModel from(Store<AppState> store){
    return ScoreCardViewModel(
      scoreCardList: store.state.scoreCardListState.scoreCardList,
      statsType: store.state.scoreCardListState.statsType,
      worstPossibleAverage: store.state.scoreCardListState.worstPossibleAverage,
      elapsedTimePerSolve: store.state.scoreCardListState.elapsedTimePerSolve,
      scramble: store.state.scoreCardListState.scramble); 
  }  
}