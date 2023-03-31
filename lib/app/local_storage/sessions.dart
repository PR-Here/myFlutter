// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

Rx<String> USER_TOKEN = ''.obs;
Rx<int> USER_ID = 0.obs;
Rx<String> FIRST_NAME = ''.obs;
Rx<String> LAST_NAME = ''.obs;
Rx<String> PASSWORD = ''.obs;
Rx<String> USER_MAIL = ''.obs;
Rx<String> PROFILE_IMAGE_PATH = ''.obs;

class SessionManager {
  static final _getStorage = GetStorage();
  static const String _userToken = 'User Token';
  static const String _userId = 'User ID';
  static const String _firstName = 'first Name';
  static const String _lastName = 'last Name';
  static const String _userMail = 'User Mail';
  static const String _password = 'password';
  static const String _profileImagePath = 'Profile Image Path';
  static const String _oracleCardClickedTime =
      'Last Clicked Time of Oracle Card';

  static void saveUserToken(String token) {
    USER_TOKEN.value = token;
    _getStorage.write(_userToken, token);
    debugPrint("User Token Saved ==> $token.");
  }

  static String? getUserToken() {
    String? token = _getStorage.read(_userToken);
    USER_TOKEN.value = token ?? '';
    debugPrint("Get User Token ==> $token.");
    return token;
  }

  static void saveProfileImagePath(String imagePath) {
    PROFILE_IMAGE_PATH.value = imagePath;
    _getStorage.write(_profileImagePath, imagePath);
    debugPrint('Profile Image Path Saved ==> $imagePath');
  }

  static void saveFirstName(String firstName) {
    FIRST_NAME.value = firstName;
    _getStorage.write(_firstName, firstName);
    debugPrint('User first name Saved ==>$firstName');
  }

  static void savelastName(String lastName) {
    LAST_NAME.value = lastName;
    _getStorage.write(_lastName, lastName);
    debugPrint('User last name Saved ==>$lastName');
  }

  static void savePassword(String password) {
    PASSWORD.value = password;
    _getStorage.write(_password, password);
    debugPrint('Password Saved ==> $password');
  }

  static void saveUserId(int id) {
    USER_ID.value = id;
    _getStorage.write(_userId, id);
    debugPrint("User ID Saved ===> $id");
  }

  static void saveUserEmail(String mailId) {
    USER_MAIL.value = mailId;
    _getStorage.write(_userMail, mailId);
    debugPrint('User Mail Saved ==> $mailId');
  }

  static int? getUserId() {
    int? id = _getStorage.read(_userId);
    USER_ID.value = id ?? 0;
    debugPrint('UserId Saved ==> $id');
    return id;
  }

  static String? getUserEmail() {
    String? mailId = _getStorage.read(_userMail);
    USER_MAIL.value = mailId ?? '';
    debugPrint('User Mail ==> $mailId');
    return mailId;
  }

  static String getPassword() {
    String password = _getStorage.read(_password);
    PASSWORD.value = password;
    debugPrint('Password ==> $password');
    return password;
  }

  static String? getFirstName() {
    String? firstName = _getStorage.read(_firstName);
    FIRST_NAME.value = firstName ?? '';
    debugPrint('User First name is $firstName');
    return firstName;
  }

  static String? getlastName() {
    String? lastName = _getStorage.read(_lastName);
    FIRST_NAME.value = lastName ?? '';
    debugPrint('User last name is $lastName');
    return lastName;
  }

  static String getProfileImagePath() {
    String imagePath = _getStorage.read(_profileImagePath) ?? '';
    PROFILE_IMAGE_PATH.value = imagePath;
    debugPrint('Profile Image Path ==> $imagePath');
    return imagePath;
  }

  static void clearSession() {
    _getStorage.erase();
    debugPrint("Session Cleared.");
  }

  static void saveOracleCardClickedTime(DateTime oracleCardClickedDateTime) {
    _getStorage.write(
        _oracleCardClickedTime, oracleCardClickedDateTime.toString());
    debugPrint(
        "Oracle Card Clicked Time Saved ==> $oracleCardClickedDateTime.");
  }

  static DateTime? getOracleCardClickedTime() {
    String oracleCardClickedDateTimeString =
        _getStorage.read(_oracleCardClickedTime) ?? '';

    debugPrint(
      "Oracle Card Clicked Time ==> $oracleCardClickedDateTimeString",
    );

    DateTime? oracleCardClickedDateTime =
        DateTime.tryParse(oracleCardClickedDateTimeString);
    return oracleCardClickedDateTime;
  }
}
