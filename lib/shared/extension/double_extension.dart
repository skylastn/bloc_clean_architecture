extension DoubleExtensions on double {
  // Convert double to a percentage string
  // String toPercentage() => "${(this * 100).toStringAsFixed(2)}%";

  // // Round the double to a specified number of decimal places
  // double roundTo(int decimalPlaces) {
  //   double mod = pow(10.0, decimalPlaces).toDouble();
  //   return ((this * mod).round().toDouble() / mod);
  // }

  // // Convert to currency string (e.g., $1,234.56)
  // String toCurrency({String symbol = '\$'}) {
  //   return "$symbol${toStringAsFixed(2)}";
  // }

  String get getStringValue {
    var result = toString();
    if (result.contains('.') && result.split('.').last == '0') {
      return result.split('.').first;
    }
    return result;
  }
}
