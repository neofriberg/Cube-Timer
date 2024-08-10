
import 'package:app/redux/store.dart';
import 'package:redux/redux.dart';

class CubeTimerViewModel{
  final int elapsedTime;
  final bool isRunning;

  CubeTimerViewModel({required this.elapsedTime, required this.isRunning});

  static CubeTimerViewModel from(Store<AppState> store){
    return CubeTimerViewModel(
      elapsedTime: store.state.cubeTimerState.elapsedTime, 
      isRunning: store.state.cubeTimerState.isRunning);
  }
}