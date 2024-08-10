
import 'package:flutter/material.dart';

@immutable
class CubeTimer{
  final int elapsedTime;
  final bool isRunning;
  const CubeTimer(this.elapsedTime, this.isRunning);
  
}