import 'dart:async';

import 'package:app/Viewmodels/cube_timer_view_model.dart';
import 'package:app/redux/score_card_list/score_card_list_actions.dart';
import 'package:app/redux/store.dart';
import 'package:app/redux/timer/timer_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';


class ActiveCubeTimer extends StatefulWidget {

  @override
  _ActiveCubeTimerState createState() => _ActiveCubeTimerState();
}

class _ActiveCubeTimerState extends State<ActiveCubeTimer> {
  
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  @override
  void initState(){
    super.initState();
    startCubeTimer(context);
  }

  void startCubeTimer(BuildContext context){
    stopwatch.start();
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer){
      if(stopwatch.isRunning) {
        Redux.store!.dispatch(StartCubeTimerAction());
        Redux.store!.dispatch(
          UpdateElapsedTimeAction(stopwatch.elapsedMilliseconds)
        );
      }else{
        timer.cancel();
      }
    });
  }

  void stopTimer(){
    stopwatch.stop();
    timer?.cancel();
    Redux.store!.dispatch(
      AddTimeToScoreCardListAction(
        time: returnFormattedText(stopwatch.elapsedMilliseconds)));
    Navigator.pop(context);
  }

  String returnFormattedText(int milli){
    String milliSeconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    var time = "$minutes:$seconds:$milliSeconds";
    return time;
}

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CubeTimerViewModel>(
      converter: (store) => CubeTimerViewModel.from(store),
      builder: (context, vm) {
        return GestureDetector(
          onTap: () => stopTimer(),
          child: Scaffold(
            body: Center(
              child: Text(returnFormattedText(vm.elapsedTime), 
              style: const TextStyle(fontSize: 40),))),
        );
      }
    );
  }
}