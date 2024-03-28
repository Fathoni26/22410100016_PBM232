void main() {
  var n = 4;
  var m = 3;
  String line;

  for (int i = 1; i <= m; i++){
    line = '';
    for(int j = 1; j <= n; j++){
      line += '*';
    }
    print(line);
  }
}
