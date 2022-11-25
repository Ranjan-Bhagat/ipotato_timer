extension FormatedString on Duration{

  String get toHHMMSS => "$inHours:${inMinutes.remainder(60)}:${(inSeconds.remainder(60))}";

}