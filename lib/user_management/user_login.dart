import 'package:bank_flutter/Controllers/login_controller.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/my_button.dart';
import 'package:bank_flutter/widgets/password_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/email_field.dart';

class UserSignInWidget extends StatefulWidget {
  const UserSignInWidget({super.key});

  @override
  State<UserSignInWidget> createState() => _UserSignInWidgetState();
}

class _UserSignInWidgetState extends State<UserSignInWidget> {
  final UsernameController = TextEditingController();

  final PasswordController = TextEditingController();

  void ShowErrorMessage(String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text),
      ),
    );
  }

  void SignUserIn() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[900],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: Dimensions.height80,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white, fontSize: Dimensions.height45),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(Dimensions.BorderRadius30)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(Dimensions.height30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: Dimensions.height45,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.BorderRadius15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              EmailField(
                                text: "User name",
                                Controller: UsernameController,
                              ),
                              PasswordField(
                                text: "Password",
                                Controller: PasswordController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        MyButton(
                          text: "Login",
                          onTap: ()async=> await LoginController().LoginWithUserID(UsernameController,PasswordController,context),
                        ),
                        SizedBox(
                          height: Dimensions.height45,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
