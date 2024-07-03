import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBarang extends StatefulWidget {
  @override
  State<AddBarang> createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _satuanController = TextEditingController();
  final TextEditingController _hargaBeliController = TextEditingController();
  final TextEditingController _hargaJualController = TextEditingController();

  String result = '';
  bool _validateKode = false;
  bool _validateNama = false;
  bool _validateSatuan = false;
  bool _validateHargaBeli = false;
  bool _validateHargaJual = false;

  Future<void> _postData() async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://172.16.59.53/android/simpan.php'));
      request.fields.addAll({
        'Kode': _kodeController.text,
        'Nama': _namaController.text,
        'Satuan': _satuanController.text,
        'HargaBeli': _hargaBeliController.text,
        'HargaJual': _hargaJualController.text,
        'save': 'ok'
      });
      http.StreamedResponse response = await request.send();
      var responseString = await response.stream.bytesToString();
      log(responseString);
      if (response.statusCode == 201 || response.statusCode == 200) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(responseString);
        setState(() {
          result = 'ID: ${responseData['id']}\nName: ${responseData['name']}\nEmail: ${responseData['email']}';
        });
        Navigator.pop(context, true);
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _satuanController.dispose();
    _hargaBeliController.dispose();
    _hargaJualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Add Barang'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Barang',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _kodeController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Kode',
                  labelText: 'Kode',
                  errorText: _validateKode ? 'Kode Value Can\'t Be Empty' : null,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Nama',
                  labelText: 'Nama',
                  errorText: _validateNama ? 'Nama Value Can\'t Be Empty' : null,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _satuanController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Satuan',
                  labelText: 'Satuan',
                  errorText: _validateSatuan ? 'Satuan Value Can\'t Be Empty' : null,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _hargaBeliController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Harga Beli',
                  labelText: 'Harga Beli',
                  errorText: _validateHargaBeli ? 'Harga Beli Value Can\'t Be Empty' : null,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _hargaJualController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Harga Jual',
                  labelText: 'Harga Jual',
                  errorText: _validateHargaJual ? 'Harga Jual Value Can\'t Be Empty' : null,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () async {
                      setState(() {
                        _validateKode = _kodeController.text.isEmpty;
                        _validateNama = _namaController.text.isEmpty;
                        _validateSatuan = _satuanController.text.isEmpty;
                        _validateHargaBeli = _hargaBeliController.text.isEmpty;
                        _validateHargaJual = _hargaJualController.text.isEmpty;
                      });
                      if (!_validateKode &&
                          !_validateNama &&
                          !_validateSatuan &&
                          !_validateHargaBeli &&
                          !_validateHargaJual) {
                        await _postData();
                      }
                    },
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 10.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      _kodeController.clear();
                      _namaController.clear();
                      _satuanController.clear();
                      _hargaBeliController.clear();
                      _hargaJualController.clear();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
