import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  String baseUrl = "https://randomuser.me/api/";

  Future<User> getUser() async {
    var url = Uri.parse(baseUrl);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return User(
        name: jsonData["results"][0]["name"]["first"] ?? "N/A",
        phone: jsonData["results"][0]["phone"],
        location: jsonData["results"][0]["location"]["city"],
        prrofileImage: jsonData["results"][0]["picture"]["medium"],
      );

    } else {
      throw Exception("Failed to load user data");
    }
  }
}


class User{
  String name;
  String location;
  String phone;
  String prrofileImage;

  User({required this.name,
    required this.phone,
    required this.location,
    required this.prrofileImage});
}


class ApiHelpers{

  String baseUrl = "https://randomuser.me/api/";

  getUser()async{

  }


}


