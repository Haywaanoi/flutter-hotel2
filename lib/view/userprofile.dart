import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String username;

  const UserInfo({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, $username!'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Quay lại màn hình đăng nhập khi logout
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

// class UserInfo extends StatelessWidget {
//   final String username;
//
//   const UserInfo({super.key, required this.username});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Information'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Hello, $username!'),
//             ElevatedButton(
//               onPressed: () {
//
//                 Navigator.of(context).pop();
//               },
//               child: Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }