import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_hotel/view/chitietphong.dart';
import '../LoaiPhong.dart';
import '../ip.dart';
import '../Sale.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  List<LoaiPhong> listloai = [];
  List<Sale> sales = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popular();
  }

  void popular() async {
    final loais = await fetchAllDrinks();
    final saless = await fetchSale();
    setState(() {
      listloai = loais;
      sales = saless;

    });

    print("danh sach: $listloai" );
  }
  Future<List<LoaiPhong>> fetchAllDrinks() async {
    final res = await http.get(Uri.parse("$url/api/loai-phongs?populate=*"));

    if(res.statusCode == 200){
      final result = jsonDecode(res.body);
      Iterable list = result["data"];
      return list.map((e) => LoaiPhong.fromJson(e)).toList();
    }
    else{
      throw Exception("faild");
    }
  }
  Future<List<Sale>> fetchSale() async {
    final res = await http.get(Uri.parse("$url/api/sales?populate=*"));

    if(res.statusCode == 200){
      final result = jsonDecode(res.body);
      Iterable list = result["data"];
      return list.map((e) => Sale.fromJson(e)).toList();
    }
    else{
      throw Exception("faild");
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: Colors.black,
              height: 1.0,
            ),
          ),

        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: SearchAnchor(
                    builder: (BuildContext context, SearchController controller){
                      return SearchBar(
                        controller: controller,
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap:() {
                          // controller.openView();
                          print("$listloai");
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search),

                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {

                          },
                        );
                      });
                    }

                ),
              ),
              Column(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                    child: Text("Best view with room",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500 ),),
                  ),
                  SizedBox(
                    height: height * .25 ,
                    width: width,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions( height: 400.0,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),

                          ),
                          items: listloai.map((loai) {
                            return Builder(
                              builder: (BuildContext context) {
                                return TextButton(onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Chitiet(loaiphong: loai,)
                                      )
                                 );
                                },
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                  ),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                      ),
                                      child:Stack(children: [
                                        Image.network(url+
                                          loai.imageLoaiPhong, // Replace with your image URL
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            left: 0,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  color: Colors.white54,
                                                  padding: const EdgeInsets.all(10),
                                                  child:  Text(
                                                    '${loai.tenLoaiPhong}',
                                                    style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                        height: 50,

                                                        color: Colors.white54,
                                                        padding: const EdgeInsets.all(10),
                                                        child:  Text(
                                                          loai.rateLoaiPhong.toString(),
                                                          style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                                                        )),
                                                    Container(
                                                      height: 50,
                                                      color: Colors.white54,
                                                      child: Icon(CupertinoIcons.star_fill,color: Colors.yellow,),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                        ),
                                      ],)
                                  ),);
                              },
                            );
                          }).toList(),
                        ),

                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Text("Sale event",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500 ),),
              ),
              CarouselSlider(
                options: CarouselOptions(height: 100.0,
                    viewportFraction: 0.5,
                    enableInfiniteScroll: false,
                    padEnds:false
                ),
                items: sales.map((sale) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topRight ,
                              end: Alignment.bottomLeft, colors: [Colors.blue,
                              Colors.red,],
                            )
                          ),
                         child: Column(
                           children: [
                             Container(
                               child: Text(sale.nameSale + " Sale" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                             ),
                             Center(
                               child: Text(sale.priceSale.toString() + "% off",style: TextStyle(fontSize: 20,)),
                             ),
                             Container(
                               child:Text(sale.daysale,style: TextStyle(fontSize: 20,)) ,
                             )
                           ],
                         ),
                      );
                    },
                  );
                }).toList(),
              )

            ],
          ),
        )

    );
  }
}
