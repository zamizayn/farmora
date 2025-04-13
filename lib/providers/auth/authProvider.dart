import 'dart:convert';

import 'package:farmora/repo/auth/authRepo.dart';
import 'package:farmora/screens/home/dashboard.dart';
import 'package:farmora/utils/customUtils.dart';
import 'package:farmora/utils/localStorage.dart';
import 'package:farmora/utils/navigationUtils.dart';
import 'package:farmora/utils/snackBarService.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_listener/internet_connection_listener.dart';

class Authprovider with ChangeNotifier {
  login(username, password) async {
    showLoading();
    final response =
        await Authrepo().login({"username": username, "password": password});
    hideLoading();
    if (response!["status"] == false) {
      SnackbarService.showSnackbar(response["error"]);
    } else {
      NavigationUtils.navigateAndRemoveUntil(
          NavigatorService.navigatorKey.currentContext!, Dashboard());
      await SharedPreferenceHelper.saveMapData("loginData", response);
      await SharedPreferenceHelper.saveData("token", response["token"]);
      SnackbarService.showSnackbar(
          "Logged In Successfully. Welcome back ${response["name"]}.");
    }
  }
}
