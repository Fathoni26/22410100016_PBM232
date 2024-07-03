import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:kasirtoko/view/addbarang.dart';
import 'modelbarang/barang.dart';
import 'view/viewbarang.dart';
import 'package:kasirtoko/view/editbarang.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Barang> _barangList = <Barang>[];
  String result = '';

  Future<void> bacabarang() async {
    try {
      var response = await http.get(Uri.parse("http://172.16.59.53/android/membaca.php"));
      log(response.body.toString());
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          setState(() {
            _barangList = (jsonData['data'] as List).map((barang) {
              return Barang(
                barang['Kode'] ?? '',
                barang['Nama'] ?? '',
                barang['Satuan'] ?? '',
                int.tryParse(barang['HargaBeli'] ?? '0') ?? 0,
                int.tryParse(barang['HargaJual'] ?? '0') ?? 0,
              );
            }).toList();
          });
        }
      } else {
        log('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    bacabarang();
  }

  _deleteFormDialog(BuildContext context, String kode) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Kamu Yakin Menghapus',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red),
                  onPressed: () async {
                    try {
                      var request = http.MultipartRequest('POST',
                          Uri.parse('http://172.16.59.53/android/hapus.php'));
                      request.fields.addAll({'Kode': kode, 'save': 'ok'});
                      http.StreamedResponse response = await request.send();
                      var responseData = await response.stream.bytesToString();
                      log(responseData);
                      if (response.statusCode == 201) {
                        setState(() {
                          result = responseData.toString();
                        });
                      } else {
                        throw Exception('Failed to post data');
                      }
                    } catch (e) {
                      setState(() {
                        result = 'Error: $e';
                      });
                    }
                    if (result.isNotEmpty) {
                      bacabarang();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Kasir'),
      ),
      body: _barangList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: _barangList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewBarang(
                            barang: _barangList[index],
                          ))).then((data) {
                    if (data != null) {
                      bacabarang();
                    }
                  });
                },
                leading: const Icon(Icons.shopping_cart),
                iconColor: Colors.purple,
                title: Text(_barangList[index].kode.toString() ?? ''),
                subtitle: Text(_barangList[index].nama ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditBarang(
                                    barang: _barangList[index],
                                  ))).then((data) {
                            if (data != null) {
                              bacabarang();
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.teal,
                        )),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, _barangList[index].kode ?? '');
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddBarang()))
              .then((data) {
            if (data == true) {
              bacabarang();
            }
          });
        },
        tooltip: 'Increment',
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
