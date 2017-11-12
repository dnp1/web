class JsonEncodableDatetime extends DateTime {
  JsonEncodableDatetime(int year) : super(year);

  JsonEncodableDatetime.fromJson(String dt)
      : super.fromMillisecondsSinceEpoch(DateTime.parse(dt).millisecondsSinceEpoch) {

  }

  String toJson() {
    return toIso8601String();
  }
}