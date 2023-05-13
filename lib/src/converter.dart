Duration durationFromJson(dynamic value) {
  return Duration(seconds: value);
}

int durationToJson(Duration duration) {
  return duration.inSeconds;
}
