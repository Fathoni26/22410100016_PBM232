class persegi{
  int _p = 20;
  int _l = 30;

  int get p => _p;

  set p(int value) {
    _p = value;
  }

  int get l => _l;

  set l(int value) {
    _l = value;
  }
}
    void main()
{
  persegi x = persegi();
  x.p = 2;
  x.l = 3;
  print(x.p);
  print(x.l);

}