class Barang{
  String? kode;
  String? nama;
  String? satuan;
  int? hargabeli;
  int? hargajual;

  Barang(this.kode, this.nama, this.satuan, this.hargabeli, this.hargajual);

  barangMap() {
    var mapping = Map<String, dynamic>();
    mapping['Kode'] = kode ?? null;
    mapping['Nama'] = nama!;
    mapping['Satuan'] = satuan!;
    mapping['HargaBeli'] = hargabeli!;
    mapping['HargaJual'] = hargajual!;
    return mapping;
  }
}