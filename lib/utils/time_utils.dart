
import 'package:app/redux/score_card_list/score_card_list_actions.dart';
import 'package:app/redux/store.dart';
import 'package:app/redux/timer/timer_actions.dart';
import 'package:flutter/material.dart';

void showPopUp(BuildContext context, int index){
  showDialog(context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Center(child: Text("Solve ${index + 1}")),
        actions: [
          TextButton(onPressed: () {
            removeSolve(index);
            Navigator.of(context).pop();
          }, 
          child: const Center(child: Text("Remove Solve", style: TextStyle(fontSize: 20),))),

          TextButton(onPressed: () {
            makePlusTwo(index);
            Navigator.of(context).pop();
          }, 
          child: const Center(child: Text(" + 2", style: TextStyle(fontSize: 20),))),
          TextButton(onPressed: () {
            makeDNF(index);
            Navigator.of(context).pop();
          }, child: const Center(child: Text("DNF", style: TextStyle(fontSize: 20),)))
        ],
      );
    });
}


void removeSolve(int index){
  if(Redux.store!.state.scoreCardListState.scoreCardList.length - 1 == index) {
    Redux.store!.dispatch(RemoveSolveAction(index));
  }
}

void makePlusTwo(int index){
  Redux.store!.dispatch(MakeSolvePlusTwoAction(index)); 
}

void updatePlusTwoString(int index){
  Redux.store!.dispatch(UpdateElapsedTimeListAction(index));
}

  String returnFormattedText(int milli){
    String milliSeconds = (milli % 1000).toString().padLeft(3, "0").substring(0, 2);
    String seconds = ((milli ~/ 1000) % 60).toString();
    String minutes = ((milli ~/ 1000) ~/ 60).toString();

  if (minutes == "0"){
    return "$seconds:$milliSeconds";
  }
    return "$minutes:$seconds:$milliSeconds";
}

void makeDNF(int index){
  Redux.store!.dispatch(MakeSolveDNFAction(index));
}