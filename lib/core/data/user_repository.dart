import 'dart:convert';
import 'package:edukasi_mobile/core/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<String> authenticate({
    @required String email,
    @required String password,
  }) async {
    await Future.delayed(Duration(milliseconds: 100));

    if (email == 'asd' && password == 'asd')
      return 'token1';
    else if (email == 'qwe' && password == 'qwe')
      return 'token2';
    else
      throw ('Invalid email or password.');
  }

  Future<User> getUser(String token) async {
    await Future.delayed(Duration(milliseconds: 100));

    if (token == 'token1')
      return User(
          id: '1',
          name: 'Airin Rachmi',
          photo:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIHHpUICEOQNc9294RuSQ4w4OPimEZZ2NK3Dlfxgx-mQpv0ClHBA&s');
    if (token == 'token2')
      return User(
          id: '2',
          name: 'Susi Pudjiastuti',
          photo:
              'https://awsimages.detik.net.id/community/media/visual/2019/09/10/cdc1d3aa-9b04-4a02-9075-f7a1d6884fd3_43.jpeg?w=780&q=90');
    else
      throw ('User not found.');
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(milliseconds: 100));
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(milliseconds: 100));
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    User user = await getUser(token);
    _prefs.setString('user', json.encode(user.toJson()));
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(milliseconds: 100));
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final user = _prefs.getString('user');
    if (user != null) return true;
    return false;
  }

  Future<User> getLoggedUser() async {
    await Future.delayed(Duration(milliseconds: 100));
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(json.decode(_prefs.getString('user')));
    return user;
  }
}
