
void main(){
  List<int> x = [10,20,30,40,50];
  List<String> y = ['A','B','C','D'];
  //menampilkan
  print(x[1]);
  print(y);
  for(var i =0;i<x.length;i++){
    print(x[i]);
  }
  for(var isi in y){
    print(isi);
  }

  //menambahkan
  x.add(60);
  print(x);
  //update
  x[1]=200;
  print(x);
  //menghapus
  x.remove(200);
  print(x);

}