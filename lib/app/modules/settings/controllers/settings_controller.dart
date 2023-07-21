import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/widget/form/custom_text_field.dart';

import '../../../core/values/app_values.dart';
import '/app/core/base/base_controller.dart';

class SettingsController extends BaseController {
  final enableBioAuthentication = false.obs;
  final RxString confirmPasswordText = "".obs;

  openConfirmPasswordDialog() async {
    await Get.dialog(
      AlertDialog(
        insetPadding: const EdgeInsets.all(AppValues.largePadding),
        title: generateDialogTitle("Nhập lại mật khẩu"),
        content: Container(
          width: Get.width * 0.9,
          child: CustomTextField(
            formControlName: 'confirmPassword',
            hintText: "Nhập lại mật khẩu để xác nhận",
            onChange: (value) {
              confirmPasswordText(value);
            },
          ),
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.symmetric(
            vertical: AppValues.largePadding,
            horizontal: AppValues.smallPadding),
        actions: [
          Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
                  backgroundColor: Colors.redAccent),
              child: const Text("Đồng ý"),
              onPressed: confirmPasswordText.value.isNotEmpty ? () async {
                closeKeyboard(Get.context!);
                if (confirmPasswordText.value == "admin") {
                  Get.back();
                  final String username = await preferenceManager.getString("username");
                  preferenceManager.setString("enableBioAuthentication", username);
                  enableBioAuthentication(true);
                } else {
                  Fluttertoast.showToast(
                      msg: 'Mật khẩu không đúng!',
                      gravity: ToastGravity.BOTTOM,
                      toastLength: Toast.LENGTH_SHORT,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      timeInSecForIosWeb: 2
                  );
                }
              } : null,
            ),
          ),
        ],
      ),
    );
    confirmPasswordText("");
  }
}
