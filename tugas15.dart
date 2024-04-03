void main(){
  var x = {'adi':20,'budi':30,'cela':40,'didi':50,'emir':60};
  print(x);
  print(x['budi']);
  //update
  x['budi']=40;
  print(x['Budi']);
  //remove
  x.remove('budi');
  print(x);
  //iterating
  for(var isi in x.keys)
    {
      print('$isi = ${x[isi]}');
    }
}