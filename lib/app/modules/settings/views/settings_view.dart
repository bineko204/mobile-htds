import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  SettingsView() {
    getBioStatus();
  }

  getBioStatus() async {
    final username = await controller.getUsername();
    final bioAuthenUsername =
        await controller.preferenceManager.getString("enableBioAuthentication");
    controller.enableBioAuthentication(
        username == bioAuthenUsername && bioAuthenUsername.isNotEmpty);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: "Cài đặt",
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.smallPadding),
      child: Row(
        children: [
          Image.asset("images/face-id.png"),
          const SizedBox(
            width: AppValues.smallPadding,
          ),
          const Expanded(child: Text("Đăng nhập bằng vân tay/face-id")),
          Switch(
            // This bool value toggles the switch.
            value: controller.enableBioAuthentication.value,
            activeColor: Colors.red,
            onChanged: (bool value) {
              if (value) {
                controller.openConfirmPasswordDialog();
              } else {
                controller.openConfirmPopup(
                    content: "Bạn có chắc chắn muốn đóng tính năng này?",
                    onConfirm: () {
                      controller.enableBioAuthentication(false);
                      controller.preferenceManager.setString("enableBioAuthentication", "");
                      Get.back();
                    });
              }
            },
          )
        ],
      ),
    );
  }
}
