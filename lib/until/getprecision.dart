int getPrecision(double number) {
  final String str = number.toString();

  if (str.contains('.')) {
    if (str.split('.')[1] == '0') {
      return 0;
    } else {
      return str.split('.')[1].length;
    }
  } else {
    return 0;
  }
}
