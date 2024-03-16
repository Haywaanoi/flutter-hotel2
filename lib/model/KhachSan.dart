class KhachSan{
  final String TenKhachSan;
  final String DiaDiem;
  final int DanhGia;
  final String GioiThieu;
  final int GiaKhachSan;
  final String ImageKhachSan;

  KhachSan({ required this.TenKhachSan,required this.DiaDiem,required this.DanhGia,required this.GioiThieu,
     required this.GiaKhachSan, required this.ImageKhachSan});

  factory KhachSan.fromJson(Map<String, dynamic> json){
    return KhachSan(
        TenKhachSan: json["attributes"]["tenKhachSan"],
        DiaDiem: json["attributes"]["DiaDiem"],
        DanhGia: json["attributes"]["DanhGia"],
        GioiThieu: json["attributes"]["GioiThieu"],
        GiaKhachSan: json["attributes"]["GiaKhachSan"],
        ImageKhachSan: json["attributes"]["ImageKhachSan"]["data"]["attributes"]["formats"]["thumbnail"]["url"]
    );
  }
}