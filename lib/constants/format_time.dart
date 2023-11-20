  String formatTime(int time) {
    int hour = (time ~/ 100) % 12;
    hour = hour == 0 ? 12 : hour; // Replace 0 with 12
    final String minute = (time % 100).toString().padLeft(2, '0');
    final String ampm = time < 1200 ? 'AM' : 'PM';
    return '$hour:$minute $ampm';
  }