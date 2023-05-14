Duration durationFromJson(dynamic value) {
  return Duration(seconds: value);
}

int durationToJson(Duration duration) {
  return duration.inSeconds;
}

String countryCodeToEmoji(String countryCode) {
  final codePoints = countryCode
      .trim()
      .toUpperCase()
      .runes
      .map((charCode) => 127397 + charCode);
  return String.fromCharCodes(codePoints);
}

String emojiToCountryCode(String emoji) {
  final codePoints = emoji.trim().runes.map((charCode) => charCode - 127397);
  return String.fromCharCodes(codePoints);
}
