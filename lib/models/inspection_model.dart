import 'dart:async';

class Inspection{
  final int inspectionTime;
  final bool inspectionRunning;
  final Timer? timer;
  final bool? inspectionButtonPressed;

  Inspection(this.timer, {required this.inspectionTime, required this.inspectionRunning, required this.inspectionButtonPressed});

}

