import 'package:http/http.dart';
import 'dart:convert';

//Here we created a class, and we're going to create an ovject of NetworkHelper in loading_screen to use the API
class NetworkHelper {
  final String url;

  NetworkHelper(this.url);
//getData is from http dart and isnt a function we made ourself. That is how we get access to jsonDecode, which breaks down our json
  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      //we have to return the body of a json, not just the json
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
