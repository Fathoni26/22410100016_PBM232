void main()
{
  var p = 0;
  var l = 10;
  var h = 0;

  try
      {
        h = (l/p) as int;
        print(h);
      }
  catch(e)
  {
    print("isi salah");
  }
}