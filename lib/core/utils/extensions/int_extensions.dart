extension IntExtensions on int {
  String monthDisplayValue() {
    const monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    if (this < 1 || this > 12) {
      throw ArgumentError('Invalid month value. Must be between 1 and 12.');
    }

    return monthNames[this - 1];
  }
}
