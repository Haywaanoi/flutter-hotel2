import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homePage.dart';
class NavigationMenu extends StatelessWidget{
  const NavigationMenu({super.key, });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(() =>  NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value ,
        onDestinationSelected: (index) => controller.selectedIndex.value= index,
        destinations: const[
          NavigationDestination(icon: Icon(CupertinoIcons.home), label: "Home"),
          NavigationDestination(icon: Icon(CupertinoIcons.arrow_counterclockwise), label: "History"),
          NavigationDestination(icon: Icon(CupertinoIcons.bed_double), label: "My Room"),
          NavigationDestination(icon: Icon(CupertinoIcons.profile_circled), label: "User")
        ],
      ),),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),

    );
  }

}



class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomePage(),Container(color: Colors.blue),Container(color: Colors.purple),Container(color: Colors.orangeAccent)];

}