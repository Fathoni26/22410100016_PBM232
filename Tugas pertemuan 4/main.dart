import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter kedua',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextEditingController isi = TextEditingController();
  TextEditingController hasil = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter kedua'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child:TextField(
                controller: isi,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Isi Nama',
                    hintText: 'Ali Topan'
                ),
              ),
            ),

            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child:ElevatedButton(
                      child: Text('Tampil'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 0
                      ),
                      onPressed: () {
                        var isi1 = isi.text.toString();
                        hasil.text= isi1.toString();

                      },

                    )
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child:TextField(
                controller: hasil,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hasil',
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}