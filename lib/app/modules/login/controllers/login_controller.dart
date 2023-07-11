import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../../routes/app_pages.dart';
import '/app/core/base/base_controller.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  final RxList<BiometricType> availableBiometrics = RxList.of([]);
  @override
  void onInit() {
    super.onInit();
    checkDeviceBio();
  }

  checkDeviceBio() async {
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();
    if (isBiometricSupported) {
      final List<BiometricType> available =
      await _localAuthentication.getAvailableBiometrics();
      if (available.isNotEmpty) {
        availableBiometrics(available);
        availableBiometrics.refresh();
      }
    }


  }

  void login(String username, String password, bool? remember) {
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
    if (availableBiometrics.isNotEmpty) {
      final bool didAuthenticate = await _localAuthentication.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: const AuthenticationOptions(biometricOnly: true));
      if (didAuthenticate) {
        login("admin", "admin", true);
      }
    }
  }
}
