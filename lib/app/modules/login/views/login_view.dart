import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/widget/form/custom_checkbox.dart';
import 'package:htds_mobile/app/core/widget/form/custom_text_field.dart';
import 'package:htds_mobile/app/routes/app_pages.dart';
import '../../../core/values/app_values.dart';
import '../controllers/login_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/text_styles.dart';

class LoginView extends BaseView<LoginController> {
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
            Text('Đăng nhập', style: extraBigTitleStyle),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppValues.largePadding),
              child: Text(
                'Điền thông tin đăng nhập của bạn để truy cập hệ thống',
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
                    label: "Mật khẩu",
                    formControlName: 'password',
                    type: "password",
                  ),
                ),
                Row(
                  children: [
                    const Flexible(
                        flex: 1,
                        child: CustomCheckbox(
                          formControlName: "remember",
                          label: "Lưu mật khẩu",
                        )),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.RESET_PASSWORD);
                        },
                        child: const Text(
                          "Đặt lại mật khẩu",
                          style: TextStyle(
                              color: Color(0xFF2B78E4),
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      Get.offNamed(Routes.MAIN);
                    },
                    child: const Text(
                      "Đăng nhập",
                      style: whiteText14,
                    )),
                const SizedBox(
                  height: AppValues.largePadding,
                ),
                Row(children: const [
                  Expanded(
                      child: Divider(
                    thickness: 2,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppValues.smallPadding),
                    child: Text(
                      "Hoặc đăng nhập bằng",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 2,
                  )),
                ]),
                const SizedBox(height: AppValues.largePadding,),
                Row(
                  children: [
                    Flexible(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffFEEBEF),
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 24, height: 24, child: Image.asset('images/finger-print.png')),
                              const SizedBox(width: AppValues.smallPadding),
                              const Text(
                                "Vân tay",
                                style: TextStyle(color: Color(0xffEF0032), fontSize: 10),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(width: AppValues.largePadding,),
                    Flexible(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xffFEEBEF),
                            minimumSize: const Size.fromHeight(48),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 24, height: 24, child: Image.asset('images/face-id.png')),
                              const SizedBox(width: AppValues.smallPadding),
                              const Text(
                                "Face ID",
                                style: TextStyle(color: Color(0xffEF0032), fontSize: 10),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: AppValues.largePadding,)
              ],
            )),
      )
    ]);
  }
}
