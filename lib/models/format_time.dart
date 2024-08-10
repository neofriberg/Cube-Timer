class FormatTime{
 final Stopwatch stopwatch;
 final int milli;
 final String milliseconds;
 final String seconds;
 final String minutes;

  FormatTime({
    required this.stopwatch, 
    required this.milli, 
    required this.milliseconds, 
    required this.seconds, 
    required this.minutes}); 

String returnFormattedText(){
  var milli = stopwatch.elapsed.inMilliseconds;
  String milliSeconds = (milli % 1000).toString().padLeft(3, "0");
  String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
  String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

  var time = "$minutes:$seconds:$milliSeconds";
  return time;
}
}
