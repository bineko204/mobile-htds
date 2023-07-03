import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:htds_mobile/app/core/widget/form/custom_text_field.dart';
import '../../../core/values/app_values.dart';
import '../controllers/reset_password_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/text_styles.dart';
import 'package:get/get.dart';

class ResetPasswordView extends BaseView<ResetPasswordController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // return CustomAppBar(
    //   appBarTitleText: 'Favorite',
    // );
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return ListView(children: [
      SizedBox(
        height: 180,
        child: Center(
          child: Image.asset('images/logo_login.png'),
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding),
        child: Column(
          children: const [
            Text('Đặt lại mật khẩu', style: extraBigTitleStyle),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppValues.largePadding),
              child: Text(
                'Tạo mật khẩu mới cho tài khoản của bạn',
              ),
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.largePadding),
        child: FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: AppValues.largePadding),
                  child: CustomTextField(
                    label: "Tên người dùng",
                    formControlName: 'username',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: AppValues.largePadding),
                  child: CustomTextField(
                    label: "Mật khẩu cũ",
                    formControlName: 'oldPassword',
                    type: "password",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: AppValues.largePadding),
                  child: CustomTextField(
                    label: "Mật khẩu mới",
                    formControlName: 'newPassword',
                    type: "password",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: AppValues.largePadding),
                  child: CustomTextField(
                    label: "Xác nhận lại mật khẩu",
                    formControlName: 'confirmPassword',
                    type: "password",
                  ),
                ),
                const SizedBox(
                  height: AppValues.largePadding,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Xác nhận",
                    style: whiteText14,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Quay lại đăng nhập",
                      style: TextStyle(
                          color: Color(0xFF2B78E4),
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    )),
                const SizedBox(
                  height: AppValues.largePadding,
                ),
              ],
            )),
      )
    ]);
  }
}
