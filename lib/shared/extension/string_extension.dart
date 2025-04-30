extension StringExtension on String {
  double get toDouble => double.tryParse(this) ?? 0;
  int get toInt {
    if (contains('.') && split('.').last == '0') {
      return int.tryParse(split('.').first) ?? 0;
    }
    return int.tryParse(this) ?? 0;
  }

  String get capitalizeFirst {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  bool get isEmail {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  DateTime get toDateTime {
    return DateTime.tryParse(this) ?? DateTime.now();
  }
}
