import 'package:app/redux/store.dart';
import 'package:app/screens/scorecard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() async{

  await Redux.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: Redux.store!,
      child: const MaterialApp(debugShowCheckedModeBanner: false,
      home: ScorecardScreen()),
    );
  }
}