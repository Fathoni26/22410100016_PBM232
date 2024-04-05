class karyawan
{
  var _nama;
  var _jabatan;
  var _gaji;

  karyawan(this._nama, this._jabatan, this._gaji);

  get nama => _nama;

  set nama(value) {
    _nama = value;
  }

  get jabatan => _jabatan;

  get gaji => _gaji;

  set gaji(value) {
    _gaji = value;
  }

  set jabatan(value) {
    _jabatan = value;
  }

  void detailkaryawan()
  {
    print("=================");
    print("Nama "+nama);
    print("Jabatan "+jabatan);
    print("Gaji "+gaji);
    print("==================");
  }
}
void main()
{
  karyawan x = karyawan("Toni", "Admin", "20000");
  x.detailkaryawan();
  x.gaji="30000";
  x.jabatan="Supervisor";
  x.detailkaryawan();
}