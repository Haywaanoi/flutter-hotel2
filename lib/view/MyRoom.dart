import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DonDatPhong.dart';
import '../ip.dart';
class MyRoom extends StatefulWidget{
  const MyRoom({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyRoomState createState() => _MyRoomState();
}

class _MyRoomState extends State<MyRoom>{
  List<DonDatPhong> dondatphong = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popular();
  }
  void popular() async {
    final dons = await fetchDonPhong();
    setState(() {
      dondatphong = dons;

    });

    print("danh sach: $dondatphong" );
  }
  Future<List<DonDatPhong>> fetchDonPhong() async {
    final res = await http.get(Uri.parse("$url/api/don-dat-phongs?populate=*"));

    if(res.statusCode == 200){
      final result = jsonDecode(res.body);
      Iterable list = result["data"];
      return list.map((e) => DonDatPhong.fromJson(e)).toList();
    }
    else{
      throw Exception("faild");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView.builder(
          itemCount: dondatphong.length,
          itemBuilder: (BuildContext context, int index) {
            final donphongs = dondatphong[index];
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber,

              ),
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 5.0),


              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)
                        ,child: Text("Loai phong :" + donphongs.tenLoaiPhong,),),
                        Padding(padding: EdgeInsets.fromLTRB(20, 5.0, 0, 0),
                        child: Text("Ngay Den :" + donphongs.NgayDen,),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(15, 5.0, 0, 0),
                          child: Text("Ngay Di :" + donphongs.NgayDi,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0)
                          ,child: Text("So nguoi :" + donphongs.SoNguoi,),),
                        Padding(padding: EdgeInsets.fromLTRB(20, 5.0, 0, 0),
                          child: Text("Tong So Ngay :" + donphongs.TongNgay,),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(30, 5.0, 0, 0),
                          child: Text("Tong So Tien :" + donphongs.TongTien,),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
    );
  }
}
