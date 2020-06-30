import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:admin_fashion_shop/components/StyledOutlineButton.dart';
import 'package:admin_fashion_shop/utils/FieldValidator.dart';
import 'package:admin_fashion_shop/components/InputTextFields.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
//  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  String retypedPassword;
  List<String> result = [];
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 61.0, bottom: 61.0, left: 25.0, right: 25.0),
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
            InputTextField(
              textObscure: false,
              textHint: 'Enter your e-mail',
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            InputTextField(
              textObscure: true,
              textHint: 'Password',
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            InputTextField(
              textObscure: true,
              textHint: 'Re-type Password',
              onChanged: (value) {
                retypedPassword = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 41.0, bottom: 41.0, left: 25.0, right: 25.0),
              child: StyledOutlineButton(
                buttonText: 'Register',
                onTap: () {
                  result = FieldValidator.validateRegistrationForm(
                      email: email,
                      password: password,
                      retypedPassword: retypedPassword);

                  //if both password and email are valid
                  if (result[0] == 'Success' && result[1] == 'Success') {
                    registerUser();
                  } else if (result[0] != 'Success' && result[1] == 'Success') {
                    Fluttertoast.showToast(
                        msg: result[0],
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                  } else if (result[1] != 'Success' && result[0] == 'Success') {
                    Fluttertoast.showToast(
                        msg: result[1],
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                  } else {
                    Fluttertoast.showToast(
                        msg: result[0],
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void registerUser() async {}
}
