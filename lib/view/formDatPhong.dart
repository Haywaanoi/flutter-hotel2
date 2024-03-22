import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_hotel/LoaiPhong.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:test_hotel/ip.dart';
import 'package:test_hotel/view/bottomBar.dart';
import 'package:test_hotel/view/homePage.dart';

class DatPhongForm extends StatefulWidget {
  final LoaiPhong loai;
  const DatPhongForm({super.key,  required this.loai,});
  @override
  // ignore: library_private_types_in_public_api
  _DatPhongFormState createState() => _DatPhongFormState();
}

class _DatPhongFormState extends State<DatPhongForm> {
  DateTime? _ngayDen;
  DateTime? _ngayDi;
  int? _soNguoi;
  @override
  Widget build(BuildContext context) {
    final loai = widget.loai;
    return Scaffold(
      appBar: AppBar(
        title: Text(loai.tenLoaiPhong),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                title: Text('Ngày đến: ${_ngayDen != null ? _ngayDen!.day.toString() + "/" + _ngayDen!.month.toString() + "/" + _ngayDen!.year.toString() : "Chưa chọn"}'),
                trailing: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                    if (picked != null && picked != _ngayDen) {
                      setState(() {
                        _ngayDen = picked;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: Text('Ngày đi: ${_ngayDi != null ? _ngayDi!.day.toString() + "/" + _ngayDi!.month.toString() + "/" + _ngayDi!.year.toString() : "Chưa chọn"}'),
                trailing: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                    if (picked != null && picked != _ngayDi) {
                      setState(() {
                        _ngayDi = picked;
                      });
                    }
                  },
                ),
              ),
              ListTile(
                title: Text('Số người: ${_soNguoi != null ? _soNguoi : "Chưa chọn"}'),
                trailing: DropdownButton<int>(
                  value: _soNguoi,
                  onChanged: (value) {
                    setState(() {
                      _soNguoi = value;
                    });
                  },
                  items: List.generate(
                    3,
                        (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text((index + 1).toString()),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Gia tien: ${loai.priceLoaiPhong}"),
              ),
              ListTile(
                title: Text('Tổng số ngày: ${_ngayDi != null && _ngayDen != null ? (_ngayDi!.difference(_ngayDen!).inDays).toString() : "Chưa chọn đủ ngày"}'),
              ),ListTile(
                title: Text(
                    'Tổng tiền: ${_ngayDi != null && _ngayDen != null ? (int.parse(loai.priceLoaiPhong) * (_ngayDi!.difference(_ngayDen!).inDays.toInt())): "Chưa chọn đủ ngày"}'
                ),
              ),
              Container(
                child: PostDataButton(ngayDen: _ngayDen, ngayDi: _ngayDi,loaiphong: loai.tenLoaiPhong, soNguoi: _soNguoi, giaPhong:int.parse(loai.priceLoaiPhong) ,tongTien:0 , tongNgay: 0,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
String formatDate(DateTime date, {String pattern = 'yyyy-MM-dd'}) {
  return DateFormat(pattern).format(date);
}

class PostDataButton extends StatelessWidget {
  final String loaiphong;
  final DateTime? ngayDen;
  final DateTime? ngayDi;
  final int? soNguoi;
  final int? tongTien;
  final int? tongNgay ;
  final int? giaPhong;

  // Constructor để nhận dữ liệu từ bên ngoài
  PostDataButton({super.key,required this.ngayDen,required
    this.ngayDi, required this.loaiphong, required this.soNguoi,  required this.tongTien,  required this.tongNgay,required this.giaPhong
    // this.soNguoi,
    // required this.giaTien,
    // required this.tongNgay,
  });

  // Hàm postData giờ đây nhận apiUrl và data từ bên ngoài khi được gọi.
  Future<http.Response> postData(String apiUrl, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer YOUR_JWT_TOKEN', // Nếu cần
      },
      body: jsonEncode(data),
    );

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        String apiUrl = '$url/api/don-dat-phongs';
        Map<String, dynamic> data = {
          'data': {
            'tenLoaiPhong': loaiphong,
            'NgayDen': formatDate(ngayDen as DateTime).toString(),
            'NgayDi': formatDate(ngayDi as DateTime).toString(),
            'SoNguoi': soNguoi.toString(),
            'TongNgay': (ngayDi!.difference(ngayDen!).inDays).toString(),
            'TongTien': (giaPhong! * (ngayDi!.difference(ngayDen!).inDays.toInt())).toString(),
            // Các trường khác...
          }
        };

        http.Response response = await postData(apiUrl, data);
        if (response.statusCode == 200) {
          print('Data posted successfully');
          showDialog<void>(
            context: context,
            barrierDismissible: false, // The user must tap a button to dismiss the dialog.
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text('Đặt phòng thành công'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        } else {
          print('Failed to post data: ${response.statusCode}');
          print('Reason: ${response.body}');
          showDialog<void>(
            context: context,
            barrierDismissible: false, // The user must tap a button to dismiss the dialog.
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text('Đặt phòng Thất bại'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Dismiss the dialog
                    },
                  ),
                ],
              );
            },
          );
        }

      },
      child: Text('Post Data'),
    );
  }
}