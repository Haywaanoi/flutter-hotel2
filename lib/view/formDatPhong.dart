import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_hotel/LoaiPhong.dart';

class DatPhongForm extends StatefulWidget {
  const DatPhongForm({Key? key}) : super(key: key);

  @override
  _DatPhongFormState createState() => _DatPhongFormState();
}

class _DatPhongFormState extends State<DatPhongForm> {
  DateTime? _ngayDen;
  DateTime? _ngayDi;
  int? _soNguoi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dat Phong Form'),
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
                    8,
                        (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text((index + 1).toString()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}