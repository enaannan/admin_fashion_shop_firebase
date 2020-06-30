import 'screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_fashion_shop/Models/chrochet_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CrochetData(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            accentColor: Color(0XFF2C2C2C)),
        home: FirstScreen(),
      ),
    );
  }
}
