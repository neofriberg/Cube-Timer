import 'dart:async';

import 'package:app/Viewmodels/inspection_view_models.dart';
import 'package:app/redux/inspection/inspection_actions.dart';
import 'package:app/redux/store.dart';
import 'package:app/utils/cube_timer_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TimeScreens extends StatefulWidget{
  const TimeScreens({super.key});


  @override
  _TimeScreensState createState() => _TimeScreensState();
}

class _TimeScreensState extends State<TimeScreens>{

  Timer? timer;

  @override
  void initState(){
    super.initState();
    setOrder();
  }

  void setOrder(){
    Redux.store!.dispatch(StartInspectionAction());
  }
   
  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return StoreConnector<AppState, InspectionViewModel>(
      converter: (store) => InspectionViewModel.from(store),
      builder: (context, vm) {
        return vm.inspectionRunning ? const InspectionTimeWidget() : ActiveCubeTimer();
        
      });
    }
  }
  
class InspectionTimeWidget extends StatefulWidget{
  const InspectionTimeWidget({super.key});

  @override
  State<InspectionTimeWidget> createState() => _InspectionTimeWidgetState();
}

class _InspectionTimeWidgetState extends State<InspectionTimeWidget> {

  Timer? timer;

  @override
  void initState(){
    super.initState();
    startInspection();
    startTimer(context);
  }

    void startTimer(BuildContext context){
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        Redux.store!.dispatch(InspectionTickAction());

      if (Redux.store!.state.inspectionState.inspectionTime == 0){
        stopInspection();
      }
    });
  }

  void stopInspection(){
    timer!.cancel();
    Redux.store!.dispatch(InspectionStopAction());
  }

  void startInspection() {
      Redux.store!.dispatch(StartInspectionAction());
    }

  void handleStartColors(){
    Redux.store!.dispatch(InspectionChangeColorAction());
  }

  void handleEndColors(){
    Redux.store!.dispatch(InspectionChangeColorAction());
  }

  void handleStartPress(){
    Redux.store!.dispatch(InspectionButtonPressedOnAction());
    handleStartColors();
  }

  void handleEndPress(){
    Redux.store!.dispatch(InspectionButtonPressedOffAction());
    stopInspection();
    handleEndColors();
  }

  void resetPress(){
    Redux.store!.dispatch(InspectionButtonPressedOnAction());
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext){
    return StoreConnector<AppState, InspectionViewModel>(
      converter: (store) => InspectionViewModel.from(store),
      builder: (context, vm){
        return GestureDetector(
          onPanStart: (details) => handleStartPress(),
          onPanEnd: (details) => handleEndPress(),
          child: Scaffold(
            body: Center(child: Text(
              vm.inspectionTime.toString(), 
              style: TextStyle(fontSize: 75, color: vm.inspectionColor))),
          ),
        );
      });
  }
}




