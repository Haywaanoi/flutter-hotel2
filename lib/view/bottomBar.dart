import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hotel/view/MyRoom.dart';
import 'package:test_hotel/view/loginform.dart';
import 'package:test_hotel/view/userprofile.dart';
import 'homePage.dart';

class NavigationMenu extends StatelessWidget{
  final String username;
  const NavigationMenu({super.key, required this.username,});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(username: username));
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

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final List<Widget> screens;
  final String username;

  NavigationController({required this.username}) : screens = [
    const HomePage(),
    Container(color: Colors.blue),
    const MyRoom(),
    username.trim().isEmpty ? const LoginForm() : UserInfo(username: username),
  ] {
    // Kiểm tra và in ra giá trị của username khi NavigationController được khởi tạo
    _checkUsername();
  }

  // Phương thức kiểm tra giá trị của username
  void _checkUsername() {
    if (username.trim().isEmpty) {
      print('Username is empty');
    } else {
      print('Username: $username');
    }
  }
}
