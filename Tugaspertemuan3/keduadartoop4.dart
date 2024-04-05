class persegi{
  int p = 20;
  static int l = 30;
  static int luas(int p1, int l1)
  {
    return (p1*l1);
  }
}
void main()
{
  print(persegi.l);
  print(persegi.luas(2,3).toString());
}