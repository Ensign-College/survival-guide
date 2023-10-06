extension DateTimeFormatting on DateTime {
  String toFormattedString() {
    return '${this.year}-${this.month.toString().padLeft(2, '0')}-${this.day.toString().padLeft(2, '0')}-${this.hour.toString().padLeft(2, '0')}-${this.minute.toString().padLeft(2, '0')}';
  }
}
