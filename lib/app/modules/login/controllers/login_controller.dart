import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../../routes/app_pages.dart';
import '/app/core/base/base_controller.dart';

class LoginController extends BaseController {
  final count = 0.obs;
  final formKey = GlobalKey<FormBuilderState>();
  void increment() => count.value++;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  void login() {
    final String username = formKey.currentState!.value["username"];
    final String password = formKey.currentState!.value["password"];
    final remember = formKey.currentState!.value["remember"];
    if (username == "admin" && password == "admin") {
      Get.offNamed(Routes.MAIN);
    } else {
      Fluttertoast.showToast(
          msg: 'Tên đăng nhập hoặc mật khẩu không đúng!',
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1
      );
    }
  }

  void bioLogin() async {
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();
    print(isBiometricSupported.toString());
  }
}
