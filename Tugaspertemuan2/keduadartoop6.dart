class persegi{
  var p = 20;
  var l = 30;
}

class balok extends persegi{
  var t = 40;
  void volume()
  {
    var v = super.p*super.l*this.t;
    print(v);
  }
}
void main()
{
  var k = balok();
  k.volume();
}