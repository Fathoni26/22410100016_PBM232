class persegi{
  int _p = 20;
  int _l = 30;

  persegi(this._p, this._l);

  int get l => _l;

  set l(int value) {
    _l = value;
  }

  int get p => _p;

  set p(int value) {
    _p = value;
  }
}
void main()
{
  var k = persegi(200,300);
  print(k.p);
  print(k.l);
}