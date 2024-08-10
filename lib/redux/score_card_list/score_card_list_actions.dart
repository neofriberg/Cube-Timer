class AddTimeToScoreCardListAction{
  final String time;

  AddTimeToScoreCardListAction({required this.time});
}

class ClearScoreCardListAction{}

class GetStatsTypeAction{}

class AddToTimeListAction{
  final int time;

  AddToTimeListAction(this.time);
}

class ChangeScrambleAction{
  final String scramble;

  ChangeScrambleAction(this.scramble);
}

class RemoveSolveAction{
  final int solveIndex;

  RemoveSolveAction(this.solveIndex);
}

class MakeSolvePlusTwoAction{
  final int solveIndex;

  MakeSolvePlusTwoAction(this.solveIndex);
}

class MakeSolveDNFAction{
  final int solveIndex;

  MakeSolveDNFAction(this.solveIndex);
}

class UpdateElapsedTimeListAction{
  final int index;

  UpdateElapsedTimeListAction(this.index);
}

class ClearTimeListAction{}