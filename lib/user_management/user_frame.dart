import 'package:bank_flutter/Screens/home_page.dart';
import 'package:bank_flutter/user_management/user_login.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserFrame extends StatefulWidget {
  final token;
  const UserFrame({super.key, required this.token});

  @override
  State<UserFrame> createState() => _UserFrameState();
}

class _UserFrameState extends State<UserFrame> {
  late String email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print("test: " + widget.token);
    // Map<String, dynamic> jwedecoded = JwtDecoder.decode(widget.token);
    //email = jwedecoded["email"];
  }

  @override
  Widget build(BuildContext context) {
      if (widget.token!= null) {
        return HomePage();
      } else {
        return UserSignInWidget();
      }
    }
}
