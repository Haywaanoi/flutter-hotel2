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

// class NavigationMenu extends StatelessWidget {
//   const NavigationMenu({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(NavigationController());
//
//     return Scaffold(
//       bottomNavigationBar: Obx(
//             () => NavigationBar(
//           height: 80,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) => controller.selectedIndex.value = index,
//           destinations: const [
//             NavigationDestination(icon: Icon(CupertinoIcons.home), label: "Home"),
//             NavigationDestination(icon: Icon(CupertinoIcons.arrow_counterclockwise), label: "History"),
//             NavigationDestination(icon: Icon(CupertinoIcons.bed_double), label: "My Room"),
//             NavigationDestination(icon: Icon(CupertinoIcons.profile_circled), label: "User"),
//           ],
//         ),
//       ),
//       body: Obx(
//             () => controller.isLoggedIn.value
//             ? ElevatedButton(
//           onPressed: () => controller.logout(),
//           child: Text('Logout'),
//         )
//             : ElevatedButton(
//           onPressed: () => controller.openLoginForm(),
//           child: Text('Login'),
//         ),
//       ),
//     );
//   }
// }
//
// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;
//   final RxBool isLoggedIn = false.obs; // Biến kiểm tra đăng nhập
//
//   // Các widget màn hình
//   final screens = [
//     const HomePage(),
//     Container(color: Colors.blue),
//     Container(color: Colors.purple),
//     Container(color: Colors.orangeAccent),
//   ];
//
//   // Hàm mở form đăng nhập
//   void openLoginForm() {
//     // Hiển thị form đăng nhập
//     // Ví dụ: Get.toNamed('/login');
//     // Đảm bảo bạn đã có một route được định nghĩa cho trang đăng nhập
//   }
//
//   // Hàm đăng xuất
//   void logout() {
//     isLoggedIn.value = false;
//     // Thực hiện bất kỳ logic đăng xuất nào ở đây, ví dụ: xóa dữ liệu đăng nhập, chuyển hướng về trang chính, vv.
//   }
// }