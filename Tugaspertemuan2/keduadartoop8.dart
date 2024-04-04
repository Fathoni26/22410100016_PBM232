abstract class  persegi{
  void luas();
}
class balok1 extends persegi
{
  var p = 20;
  var l = 40;
  void luas()
  {
    var m = p*l;
    print(m);
  }
}

class balok2 extends persegi
{
  var p = 60;
  var l = 80;
  void luas()
  {
    var m = p*l;
    print(m);
  }
}
void main()
{
  balok1 k2 = balok1();
  balok2 k3 = balok2();
  k2.luas();
  k3.luas();
}