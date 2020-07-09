extension TimeUtils on int {
  String getTimeString() {
    final int hour = this ~/ 60;
    final int minutes = this % 60;
    return '${hour.toString().padLeft(1, "0")}h ${minutes.toString().padLeft(2, "0")}min';
  }
}
