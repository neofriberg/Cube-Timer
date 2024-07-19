 import 'package:app/pages/inspection.dart';
import 'package:app/pages/score_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
 }

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(title: 'Cube App',
    home: ScoreCard(),);
  }
 }