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