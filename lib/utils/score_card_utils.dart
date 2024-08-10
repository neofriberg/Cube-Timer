import 'dart:ffi';
import 'dart:math';

import 'package:app/redux/score_card_list/score_card_list_actions.dart';
import 'package:app/redux/store.dart';

String getAO5(List<int> timeList){
  List<int> copiedList = [...timeList];

  List<int> countingTimes = (copiedList..sort()).sublist(1, 4);
  int average = (countingTimes.reduce((a, b) => a + b) / countingTimes.length).round();

  String milliSeconds = (average % 1000).toString().padLeft(3, "0").substring(0, 2);
  String seconds = ((average ~/ 1000) % 60).toString();
  String minutes = ((average ~/ 1000) ~/ 60).toString();

  if (minutes == "0")
  {
    return "$seconds.$milliSeconds";
 } else{
  return "$minutes:$seconds.$milliSeconds";
 }
}

String getBPA(List<int> timeList){
  List<int> copiedList = [...timeList];
    copiedList.add(0);
    return getAO5(copiedList);
}
String getWPA(List<int> timeList){
  List<int> copiedList = [...timeList];
    copiedList.add(copiedList.reduce(max) + 10);
    return getAO5(copiedList);
  }

void showScramble(){
    Redux.store!.dispatch(ChangeScrambleAction(generateScramble()));
  }

String generateScramble(){
  List<String> scrambleList = [];

  Random random = Random();

  final List<String> moves = ["R", "L", "U", "D", "F", "B"];
  final List<String> direction = ["", "'", "2"];


  List<String> moveList = generateRandomMovesLoop(scrambleList, moves, random);

  return createString(moveList, random, direction);
}


String createString(List<String> scrambleList, Random random, List<String> direction){
  String finalScramble = "";
  for(int i = 0; i < scrambleList.length; i++){

   var randomDirection = random.nextInt(direction.length); 

    finalScramble += scrambleList[i];
    finalScramble += direction[randomDirection];
    finalScramble += " ";
  }
  return finalScramble;
}

List<String> generateRandomMovesLoop(List<String> scrambleList, List<String> moves, Random random){

  
  for (int i = 0; i < 25; i++){
      generateMoves(scrambleList, moves, random, i);
  } 
  return scrambleList; 
  
}

void generateMoves(List<String> scrambleList, List<String> moves, Random random, int i){

   var randomMoveindex = random.nextInt(moves.length);
    if (scrambleList.isNotEmpty){
      if (scrambleList[i - 1] == moves[randomMoveindex]){
        generateMoves(scrambleList, moves, random, i);
      } else{
        scrambleList.add(moves[randomMoveindex]);
      }
  } else{
    scrambleList.add(moves[randomMoveindex]);
  } 
}