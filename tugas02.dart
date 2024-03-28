void main() {
  var n = 38;
  if (n >= 0 && n < 100) {
    if (n % 2 == 0) {
      print('$n adalah bilangan genap');
    } else {
      print('$n adalah bilangan ganjil');
    }
  } else {
    print('Input diluar rentang (0-99)');
  }
}
