import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:test_hotel/ip.dart';
import 'package:test_hotel/view/formDatPhong.dart';
import '../LoaiPhong.dart';
import 'homePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Chitiet extends StatelessWidget {
 final LoaiPhong loaiphong;
  Chitiet({super.key, required this.loaiphong, ngay});



 @override
 Widget build(BuildContext context) {
   String _selectedNumber = '1';
   return Scaffold(
     body: Stack(
       children: [
         IconButton(
           icon: Icon(Icons.arrow_back),
           onPressed: () {
             // Xử lý sự kiện khi người dùng nhấn nút quay về
             Navigator.of(context).pop(); // Đóng màn hình hiện tại
           },
         ),


         Container(
           color: Colors.red,
           height: 300,
           width: double.infinity,
           child: Image.network(
             url+loaiphong.imageLoaiPhong,
             fit: BoxFit.cover,
           ),
         ),
         Expanded(
             child: Container(
               width: double.infinity,
               margin: const EdgeInsets.only(top: 240),
               padding: const EdgeInsets.only(top: 10),
               decoration: const BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(60),
                     topRight: Radius.circular(60),
                   )),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     margin: const EdgeInsets.only(
                       left: 30,
                     ),
                     child:  Text(
                       loaiphong.tenLoaiPhong,
                       style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.only(
                       left: 35,
                       top: 10,
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.only(left: 35, top: 10),
                     child: const Text(
                       "Price",
                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.only(
                       left: 25,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text(
                           loaiphong.priceLoaiPhong,
                           style: TextStyle(
                             fontSize: 40,
                             fontWeight: FontWeight.bold,
                             color: Color(0xFFECB458),
                           ),
                         ),
                         const SizedBox(
                           width: 40,
                         ),
                         Column(
                           children: [
                             Row(
                               children: [
                                 Text(
                                   loaiphong.rateLoaiPhong.toString(),
                                   style: TextStyle(
                                       fontSize: 20, fontWeight: FontWeight.bold),
                                 ),
                                 Icon(Icons.star, color: Colors.yellow,),
                                 Text(
                                   "Review",
                                   style: TextStyle(
                                       fontSize: 20, fontWeight: FontWeight.bold),
                                 ),
                               ],
                             )
                           ],
                         ),
                         const SizedBox(
                           width: 5,
                         ),
                       ],
                     ),
                   ),
                   Container(
                     // color: Colors.red,
                     margin: const EdgeInsets.only(right: 20, left: 30),
                     width: double.infinity,
                     child:  Text(
                       loaiphong.descriptionLoaiPhong,
                       style: TextStyle(fontSize: 19, color: Color(0xFF5C5C5C)),
                     ),
                   ),
                   Container(
                     margin: const EdgeInsets.only(left: 35),
                     child: const Text(
                       "",
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Color(0xFFd5a456),
                       ),
                     ),
                   ),
                   Expanded(
                       child: Container(
                         width: double.infinity,
                         decoration: const BoxDecoration(
                             color: Color(0xFF1a2f3c),
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(60),
                               topRight: Radius.circular(60),
                             )),
                         child: Column(
                           children: [
                             Container(
                               width: double.infinity,
                               margin: const EdgeInsets.only(top: 10, bottom: 15),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Column(
                                     children: const [
                                       Icon(
                                         Icons.restaurant,
                                         color: Color(0xFFd5a456),
                                       ),
                                       Text(
                                         "Food",
                                         style: TextStyle(color: Colors.white),
                                       )
                                     ],
                                   ),
                                   const SizedBox(
                                     width: 20,
                                   ),
                                   Column(
                                     children: const [
                                       Icon(
                                         Icons.pool,
                                         color: Color(0xFFd5a456),
                                       ),
                                       SizedBox(
                                         height: 8,
                                       ),
                                       Text(
                                         "Pool",
                                         style: TextStyle(color: Colors.white),
                                       )
                                     ],
                                   ),
                                   const SizedBox(
                                     width: 20,
                                   ),
                                   Column(
                                     children: const [
                                       Icon(
                                         Icons.fitness_center,
                                         color: Color(0xFFd5a456),
                                       ),
                                       Text(
                                         "Gym",
                                         style: TextStyle(color: Colors.white),
                                       )
                                     ],
                                   ),
                                   const SizedBox(
                                     width: 20,
                                   ),
                                   Column(
                                     children: const [
                                       Icon(
                                         Icons.tv,
                                         color: Color(0xFFd5a456),
                                       ),
                                       Text(
                                         "Tv",
                                         style: TextStyle(color: Colors.white),
                                       )
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Container(
                                 alignment: Alignment.center,
                                 decoration: const BoxDecoration(
                                     color: Color(0xFF268db5),
                                     borderRadius: BorderRadius.all(Radius.circular(14))),
                                 height: 50,
                                 width: 200,

                                   child:  TextButton(
                                     onPressed: () {
                                       Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                               builder: (context) => DatPhongForm(loai: loaiphong,)
                                           )
                                       );
                                     },
                                     child: Text(
                                       "BOOK THIS HOTEL",
                                       style: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 16),
                                     ),
                                   )
                                 )

                           ],
                         ),
                       ))
                 ],
               ),
             )),
       ],
     ),
   );
 }


}


//
//
// child:  TextButton(
// onPressed: ()  {
// showDialog(context: context,
// builder: (context)=>  AlertDialog(
// content: Stack(
// clipBehavior: Clip.none,
// children: <Widget>[
// Positioned(
// right: -20,
// top: -40,
// child: InkResponse(
// onTap: () {
// Navigator.of(context).pop();
// },
// child: const CircleAvatar(
// backgroundColor: Colors.red,
// child: Icon(Icons.close),
// ),
// ),
// ),
// Form(
// child: Column(
//
// mainAxisSize: MainAxisSize.min,
// children: <Widget>[
// Padding(padding:  EdgeInsets.all(8),
// child:  Text("SONA Hotel Booking Form", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
// ),
// Padding(padding: EdgeInsets.all(8.0),
// child: Text("Room type: " + loaiphong.tenLoaiPhong,),
// ),
// Container(padding: EdgeInsets.all(8.0),
// child: Text("Price: " + loaiphong.priceLoaiPhong),
// ),Container(padding: EdgeInsets.all(8.0),
// child: Text("Number of guest :"),
// ),
// ListTile(
// title: Text('Ngày đến: '),
// trailing: NgayDen(onDatePicked: _handleDatePicked)
// ),
// // Các thuộc tính khác của TextFormField
//
// ],
// ),
//
//
//
// )
// ],
// ),
// ));
// },