class persegi
{
  var p = 20;
  var l = 40;
  void luas()
  {
    var m = p*l;
    print(m);
  }
}
class balok
{
  var p1 = 40;
  var l1 = 80;
  var t1 = 160;
  void volume()
  {
    var v = p1*l1*t1;
    print(v);
  }
}

class ruang implements persegi, balok
{
  @override
  late int l;

  @override
  late int l1;

  @override
  late int p;

  @override
  late int p1;

  @override
  late int t1;

  @override
  void luas() {
    // TODO: implement luas
    var m = p*l;
    print(m);
  }

  @override
  void volume() {
    // TODO: implement volume
    var v = p1*l1*t1;
    print(v);
  }

}
void main()
{
  ruang k = ruang();
  k.p = 2;
  k.l = 3;
  k.p1 = 20;
  k.l1 = 30;
  k.t1 = 40;
  k.luas();
  k.volume();

}
