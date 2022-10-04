import 'dart:convert';

import 'package:getbloc_gamal/modules/users/models/user_model.dart';
import 'package:getbloc_gamal/uttils/config.dart';
import 'package:http/http.dart' as http;

class UserControllers {
  Future<List<UserModel>> getDataUser() async {
    final url = Uri.parse(Config.getUserUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception('Failed API');
    }
    //return [];
  }
}
