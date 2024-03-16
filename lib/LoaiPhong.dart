class LoaiPhong{
  final String tenLoaiPhong;
  final String descriptionLoaiPhong;
  final String priceLoaiPhong;
  final int rateLoaiPhong;
  final String imageLoaiPhong;

  LoaiPhong({ required this.tenLoaiPhong,required this.descriptionLoaiPhong, required this.imageLoaiPhong,required this.priceLoaiPhong, required this.rateLoaiPhong, });

  factory LoaiPhong.fromJson(Map<String, dynamic> json){
    return LoaiPhong(
        tenLoaiPhong: json["attributes"]["tenLoaiPhong"],
        descriptionLoaiPhong: json["attributes"]["descriptionLoaiPhong"],
        imageLoaiPhong: json["attributes"]["imageLoaiPhong"]["data"]["attributes"]["formats"]["thumbnail"]["url"],
        priceLoaiPhong: json["attributes"]["priceLoaiPhong"],
        rateLoaiPhong: json["attributes"]["rateLoaiPhong"],);

  }
}