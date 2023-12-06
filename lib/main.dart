import 'package:bank_flutter/Screens/Assets_page.dart';
import 'package:bank_flutter/Screens/home_page.dart';
import 'package:bank_flutter/user_management/user_frame.dart';
import 'package:bank_flutter/user_management/user_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  runApp(MyApp(token: token,));
}

class MyApp extends StatelessWidget {
  final token;
  MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/Assets': (context)=>AssetsPage(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserFrame(token: token),
    );
  }
}
