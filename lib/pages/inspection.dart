import 'dart:async';
import 'package:app/redux/inspection/inpection_actions.dart';
import 'package:app/redux/inspection/inspection_state.dart';
import 'package:app/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Inspection extends StatefulWidget{
  final int inspectionTime;

  const Inspection({super.key, required this.inspectionTime});
  @override
  _InspectionState createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {

  @override
  void initState(){
    super.initState();
    _startInspection();
  }

  void _startInspection() {
    Redux.store!.dispatch(updateInspectionTime);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState>()
  }

}