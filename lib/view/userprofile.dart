import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String username;
  final VoidCallback onLogout;

  const UserInfo({Key? key, required this.username, required this.onLogout})
      : super(key: key);

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
                // Thực hiện điều hướng trở lại trang đăng nhập khi bấm nút "Logout"
                Navigator.of(context).pop();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}