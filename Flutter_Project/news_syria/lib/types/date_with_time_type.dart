class DateWithTime {
  final String date, time;
  const DateWithTime({required this.date, required this.time});
  factory DateWithTime.fromString(String pubDate) {
    final List<String> data = pubDate.split(" ");
    return DateWithTime(date: data[0], time: data[1]);
  }
}
