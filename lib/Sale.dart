class Sale{
  final String nameSale;
  final int priceSale;
  final String daysale;
  Sale({ required this.nameSale,required this.priceSale , required this.daysale});

  factory Sale.fromJson(Map<String, dynamic> json){
    return Sale(
      nameSale: json["attributes"]["nameSale"],
      priceSale: json["attributes"]["priceSale"],
      daysale: json["attributes"]["daysale"]
    );

  }
}