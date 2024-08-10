import 'package:app/Viewmodels/score_card_view_model.dart';
import 'package:app/redux/score_card_list/score_card_list_actions.dart';
import 'package:app/redux/store.dart';
import 'package:app/screens/inspection_timer_screen.dart';
import 'package:app/utils/score_card_utils.dart';
import 'package:app/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ScorecardScreen extends StatefulWidget {
  const ScorecardScreen({super.key});

  @override
  State<ScorecardScreen> createState() => _ScorecardScreenState();
}

class _ScorecardScreenState extends State<ScorecardScreen> {

  @override
  void initState() {
    super.initState();
    showScramble();
  }


  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScoreCardViewModel>(converter: (store) => ScoreCardViewModel.from(store),
    builder: (context, vm){
      return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Event Session"))),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Text(vm.scramble, style: const TextStyle(fontSize: 20),)),
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
                child: GestureDetector(
                  onTap: () {
                    showPopUp(context, index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, 
                        width: 1.5)), width: 250, height: 50,
                        child: Center(child: Text(showTime, style: const TextStyle(fontSize: 30),)),),
                ),
              )
            ],);
          }),),
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 75, 
              width: 300,
            child: Column(
              children: [
                Center(
                  child: 
                  Row(
                    children: [
                      Text(vm.scoreCardList.isNotEmpty ? vm.statsType : "", 
                        style: const TextStyle(fontSize: 25),),
                      const SizedBox(width: 10,),
                      Text(vm.scoreCardList.length == 4 ? getBPA(vm.elapsedTimePerSolve) : 
                        vm.scoreCardList.length == 5 ? getAO5(vm.elapsedTimePerSolve) : "", style: const TextStyle(fontSize: 25))
                    ],
                  )),
                  Row(
                    children: [
                      Text(vm.scoreCardList.length == 4 ? vm.worstPossibleAverage : "", 
                      style: const TextStyle(fontSize: 25)),
                      const SizedBox(width: 10,),
                      Text(vm.scoreCardList.length == 4 ? getWPA(vm.elapsedTimePerSolve) : "",
                      style: const TextStyle(fontSize: 25)),
                    ],
                  ),
              ],
            ),),


          ), vm.scoreCardList.length < 5 ? const StartInspectionWidget() : const ClearScoreCardWidget()
        ],),
      );
    });
  }
}

class StartInspectionWidget extends StatelessWidget {
  const StartInspectionWidget({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TimeScreens()));
    },  minWidth: 50, height: 50, color: Colors.blue, child: const Text("Start inspection"), );
  }
}

class ClearScoreCardWidget extends StatelessWidget {
  const ClearScoreCardWidget({super.key});

  void clearScoreCard (){
    Redux.store!.dispatch(ClearScoreCardListAction()); 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () {
      clearScoreCard();
    }, minWidth: 50, height: 50, color: Colors.blue,
      child: const Text("Clear ScoreCard List"),);
  }
}