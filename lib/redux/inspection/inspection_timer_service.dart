import 'dart:async';

import 'package:app/redux/inspection/inspection_actions.dart';

class InspectionTimerService{
  Timer? timer;

  void startTimer(Function(dynamic action) dispatch){
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      dispatch(InspectionTickAction());
    });
  }

  void stopTimer(){
    timer?.cancel();
  }

}