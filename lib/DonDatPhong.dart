class DonDatPhong{
  final String tenLoaiPhong;
  final String NgayDen;
  final String NgayDi;
  final String SoNguoi;
  final String TongNgay;
  final String TongTien;

  DonDatPhong({required this.tenLoaiPhong, required this.NgayDen, required this.NgayDi, required this.SoNguoi, required this.TongNgay, required this.TongTien});
  factory DonDatPhong.fromJson(Map<String, dynamic> json){
    return DonDatPhong(
        tenLoaiPhong: json["attributes"]["tenLoaiPhong"],
        NgayDen: json["attributes"]["NgayDen"],
        NgayDi: json["attributes"]["NgayDi"],
        SoNguoi: json["attributes"]["SoNguoi"],
        TongNgay: json["attributes"]["TongNgay"],
        TongTien: json["attributes"]["TongTien"]

    );

  }
}