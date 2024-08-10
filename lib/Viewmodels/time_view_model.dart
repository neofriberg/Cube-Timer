import 'package:app/redux/store.dart';
import 'package:redux/redux.dart';

class TimeViewModel{
  final String time;
  final bool isPlusTwo;
  final bool isDNF;

  TimeViewModel({
    required this.time, 
    required this.isPlusTwo, 
    required this.isDNF});

  static TimeViewModel from(Store<AppState> store){
    return TimeViewModel(
      time: store.state.timeState.time,
      isPlusTwo: store.state.timeState.isPlusTwo,
      isDNF: store.state.timeState.isDNF); 
  }
}