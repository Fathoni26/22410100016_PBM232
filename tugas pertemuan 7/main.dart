import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List View Example'),
        ),
        body: MyListView(),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // Model 1
        ListTile(
          leading: Icon(Icons.favorite),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('dua kalimat'),
              Text('lines', style: TextStyle(fontSize: 12)),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star),
              Icon(Icons.info),
            ],
          ),
        ),

        // Model 2
        ListTile(
          leading: Icon(Icons.star),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('dua baris dalam beberapa kalimat'),
              Text('Line 1', style: TextStyle(fontSize: 12)),
              Text('Subtitle Line 2', style: TextStyle(fontSize: 12)),
            ],
          ),
          trailing: Icon(Icons.info),
        ),

        // Model 3
        ListTile(
          leading: Icon(Icons.info),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('dengan 3 baris'),
                    Text('Subtitle Line 1', style: TextStyle(fontSize: 12)),
                    Text('Line 2', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('dengan 3 baris'),
                    Text('Line 1', style: TextStyle(fontSize: 12)),
                    Text('Subtitle Line 2', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Model 4
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('3 baris kalimat'),
                    Text('Subtitle Line 1', style: TextStyle(fontSize: 12)),
                    Text('Line 2', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('tulisan dalam 3 baris'),
                    Text('Line 1', style: TextStyle(fontSize: 12)),
                    Text('Subtitle Line 2', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.access_alarm),
        ),

        // Model 5
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ikon terakhir berada di pojok kanan
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title with Three Lines'),
                  Row(
                    children: [
                      Text('Subtitle Line 1'),
                      Icon(Icons.person),
                    ],
                  ),
                ],
              ),
              Icon(Icons.info),
            ],
          ),
        )
      ],
    );
  }
}
