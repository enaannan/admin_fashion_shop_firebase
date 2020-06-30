import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:admin_fashion_shop/components/StyledOutlineButton.dart';
import 'package:admin_fashion_shop/utils/FieldValidator.dart';
import 'package:admin_fashion_shop/components/InputTextFields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:admin_fashion_shop/utils/login.dart';
import 'package:admin_fashion_shop/screens/homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = 'nii@gmail.com'; //todo: remove default sign in address
  String password = '123456789';
  List<String> loginValidationResponse;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 41.0, bottom: 41.0, left: 25.0, right: 25.0),
                child: Image(
                  image: AssetImage('images/Kizita Logo.png'),
                ),
              ),
            ),
            Container(
              width: 50.0,
              height: 50.0,
              child: Center(
                  child: Text('ADMINISTRATOR',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.red,
                          fontStyle: FontStyle.italic))),
            ),
            Column(
              children: <Widget>[
                InputTextField(
                  textHint: 'email',
                  textObscure: false,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 30.0),
                InputTextField(
                  textHint: 'password',
                  textObscure: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 41.0, bottom: 100.0, left: 25.0, right: 25.0),
                  child: StyledOutlineButton(
                    buttonText: 'Login',
                    onTap: () async {
                      loginValidationResponse =
                          FieldValidator.validateLoginForm(email, password);
                      if (loginValidationResponse[0] == 'Success' &&
                          loginValidationResponse[1] == 'Success') {
                        String result =
                            await loginUser(email: email, password: password);
                        if (result == 'Login Success') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      } else if (loginValidationResponse[0] != 'Success' &&
                          loginValidationResponse[1] == 'Success') {
                        Fluttertoast.showToast(
                            msg: loginValidationResponse[0],
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      } else if (loginValidationResponse[1] != 'Success' &&
                          loginValidationResponse[0] == 'Success') {
                        Fluttertoast.showToast(
                            msg: loginValidationResponse[1],
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      } else {
                        Fluttertoast.showToast(
                            msg: loginValidationResponse[1],
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
