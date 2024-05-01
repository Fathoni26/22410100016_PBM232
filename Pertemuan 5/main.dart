import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Kedua',
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
  TextEditingController isi1 = TextEditingController();
  TextEditingController isi2 = TextEditingController();
  TextEditingController hasil = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Kedua'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: isi1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Isi Angka 1',
                    hintText: ''),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: isi2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Isi Angka 2',
                    hintText: ''),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var angka1 = double.parse(isi1.text);
                      var angka2 = double.parse(isi2.text);
                      hasil.text = (angka1 + angka2).toString();
                    });
                  },
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var angka1 = double.parse(isi1.text);
                      var angka2 = double.parse(isi2.text);
                      hasil.text = (angka1 - angka2).toString();
                    });
                  },
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var angka1 = double.parse(isi1.text);
                      var angka2 = double.parse(isi2.text);
                      hasil.text = (angka1 * angka2).toString();
                    });
                  },
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var angka1 = double.parse(isi1.text);
                      var angka2 = double.parse(isi2.text);
                      hasil.text = (angka1 / angka2).toString();
                    });
                  },
                  child: Text(':'),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: hasil,
                readOnly: true,
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
