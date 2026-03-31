String formateDate(DateTime date) {
  return "${date.year}/${date.month}/${date.day}\n${date.hour < 12 ? date.hour : (date.hour - 12).abs()}:${date.minute}:${date.second} ${date.hour < 12 ? "AM" : "PM"}";
}
