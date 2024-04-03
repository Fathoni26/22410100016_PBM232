void main(){
  Set<int> x = {10,20,30,40,50};
  Set<String> y = {'A','B','C','D'};
  //menampilkan
  print(x);
  print(y);
  print(x.elementAt(1));

  //menampilkan dengan index

  for(int i = 0;i<x.length;i++)
    {
      print(x.elementAt(i));
    }
  for(String isi in y)
    {
      print(isi);
    }
  //menambah
  x.add(60);
  print(x);

  //menghapus
  x.remove(60);
  print(x);
}