//should hit API endpoint
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void getAllProducts() async {
//post request
  var url = 'http://10.0.2.2:3000/user/getallcrochet';

  var response = await http.get(url);
  var jasonResponse = convert.jsonDecode(response.body);

  return jasonResponse;

//  for(var i=0;i<response.contentLength;i++){}
//  CrochetData().addProduct(newImagePath: ,newCrochetPrice: ,newCrochetProductName: )
}
