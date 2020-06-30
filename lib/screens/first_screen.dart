import 'package:flutter/material.dart';
import 'package:admin_fashion_shop/components/StyledOutlineButton.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            width: 100.0,
            height: 100.0,
            child: Center(
                child: Text('ADMINISTRATOR',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                        fontStyle: FontStyle.italic))),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 25.0),
                child: StyledOutlineButton(
                  buttonText: 'Login',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 21.0, horizontal: 25.0),
                child: StyledOutlineButton(
                  buttonText: 'Register',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()));
                  },
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
