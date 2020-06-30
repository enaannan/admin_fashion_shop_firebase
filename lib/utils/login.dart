//should hit API endpoint
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<String> loginUser({String email, String password}) async {
//  print(email);

  var url = 'http://10.0.2.2:3000/admin/login';
//  127.0.0.1:3000

  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: convert.jsonEncode(<String, String>{
      'email': 'sasa@gmail.com',
      'password': 'godisgreat',
    }),
  ); // set up POST request arguments

  if (response.statusCode == 200 && response.body.length != 0) {
    return 'Login Success';
  } else {
    return response.body;
  }
}

//todo: get all products
//void getCrochetProducts() async {
////post request
//  var url = 'http://10.0.2.2:3000/user/getallcrochet';
//
//  var response = await http.get(url);
//  var jasonResponse = convert.jsonDecode(response.body);
//  print(jasonResponse);
//}
