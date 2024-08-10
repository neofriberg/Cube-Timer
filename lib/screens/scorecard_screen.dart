import 'package:app/Viewmodels/score_card_view_model.dart';
import 'package:app/redux/store.dart';
import 'package:app/screens/inspection_timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ScorecardScreen extends StatefulWidget {
  const ScorecardScreen({super.key});

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScoreCardViewModel>(converter: (store) => ScoreCardViewModel.from(store),
    builder: (context, vm){
      return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Competition name"))),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(child: Container(height: 50, width: 300, decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1.5)),)),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            int solveNumner = index + 1;
            String showTime = vm.scoreCardList.length > index ? vm.scoreCardList[index] : "";

            return Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$solveNumner", style: const TextStyle(fontSize: 30),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, 
                      width: 1.5)), width: 250, height: 50,
                      child: Center(child: Text(showTime, style: const TextStyle(fontSize: 30),)),),
              )
            ],);
          }),),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(height: 75, width: 300, decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: const Center(child: Text("Average of 5 = 7.25", style: TextStyle(fontSize: 25),)),),
          ), MaterialButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TimeScreens()));
          }, minWidth: 50, height: 50, color: Colors.blue, child: const Text("Start inspection"),)
        ],),
      );
    });
  }
}
