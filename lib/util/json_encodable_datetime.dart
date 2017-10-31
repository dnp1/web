class JsonEncodableDatetime extends DateTime {
  JsonEncodableDatetime(int year) : super(year);

  JsonEncodableDatetime.fromJson(int milliseconds)
      : super.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);

  String toJson() {
    return millisecondsSinceEpoch.toString();
  }
}