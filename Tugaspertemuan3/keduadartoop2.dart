class persegi{
  int p =20;
  int l =30;

  void luas(int p1, int l1)
  {
    this.p = p1;
    this.l = l1;
    var L = p*l;
    print(L);
  }
  int luasreturn(int p1, int l1)
  {
    this.p = p1;
    this.l = l1;

    return this.p*this.l;
  }
}
void main()
{
  var k = persegi();
  k.luas(2, 3);
  print(k.p);
  print(k.l);
  print(k.luasreturn(4, 10));

}