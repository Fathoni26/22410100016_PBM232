class persegi
{
  var _p = 20;
  var _l = 30;

  get p => _p;

  set p(value) {
    _p = value;
  }

  get l => _l;

  set l(value) {
    _l = value;
  }

  void luas()
  {
    var L = p*l;
    print(l);
  }

  void keliling()
  {
    var k = (p+l)*2;
    print(k);
  }
}
void main()
{
  persegi x = persegi();
  x.p = 20;
  x.l = 30;
  x.luas();
  x.keliling();

  x.p = 2;
  x.l = 3;
  x.luas();
  x.keliling();
}