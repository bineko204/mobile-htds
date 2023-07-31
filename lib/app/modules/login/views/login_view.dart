import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/widget/form/custom_checkbox.dart';
import 'package:htds_mobile/app/core/widget/form/custom_text_field.dart';
import 'package:htds_mobile/app/data/repository/go_sign_repository.dart';
import 'package:htds_mobile/app/routes/app_pages.dart';
import 'package:htds_mobile/go_sdk_chanel/go_sdk_chanel.dart';
import 'package:local_auth/local_auth.dart';
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
        child: const Column(
          children: [
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
            onChanged: () {
              controller.formKey.currentState!.save();
              debugPrint(controller.formKey.currentState!.value.toString());
            },
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppValues.largePadding),
                  child: CustomTextField(
                    label: "Tên người dùng",
                    formControlName: 'username',
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Tên người dùng không được để trống"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: AppValues.largePadding),
                  child: CustomTextField(
                    label: "Mật khẩu",
                    formControlName: 'password',
                    type: "password",
                    // validators: [
                    //   FormBuilderValidators.required(errorText: "Mật khẩu không được để trống"),
                    // ],
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
                      if (controller.formKey.currentState?.saveAndValidate() ??
                          false) {
                        controller.login(
                            controller.formKey.currentState!.value["username"],
                            controller.formKey.currentState!.value["password"],
                            controller.formKey.currentState!.value["remember"]);
                      }
                    },
                    child: const Text(
                      "Đăng nhập",
                      style: whiteText14,
                    )),
                const SizedBox(
                  height: AppValues.largePadding,
                ),
                Obx(
                  () => Visibility(
                      visible: controller.availableBiometrics.isNotEmpty && controller.enableBioAuthentication.value,
                      child: Column(
                        children: [
                          const Row(children: [
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
                          const SizedBox(
                            height: AppValues.largePadding,
                          ),
                          Row(
                            children: [
                              Visibility(
                                visible: controller.availableBiometrics
                                    .contains(BiometricType.fingerprint),
                                child: Flexible(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffFEEBEF),
                                        minimumSize: const Size.fromHeight(48),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Image.asset(
                                                  'images/finger-print.png')),
                                          const SizedBox(
                                              width: AppValues.smallPadding),
                                          const Text(
                                            "Vân tay",
                                            style: TextStyle(
                                                color: Color(0xffEF0032),
                                                fontSize: 10),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              Visibility(
                                  visible: controller.availableBiometrics
                                          .contains(BiometricType.face) &&
                                      controller.availableBiometrics
                                          .contains(BiometricType.fingerprint),
                                  child: const SizedBox(
                                    width: AppValues.largePadding,
                                  )),
                              Visibility(
                                visible: controller.availableBiometrics
                                    .contains(BiometricType.face),
                                child: Flexible(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffFEEBEF),
                                        minimumSize: const Size.fromHeight(48),
                                      ),
                                      onPressed: () {
                                        controller.bioLogin();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Image.asset(
                                                  'images/face-id.png')),
                                          const SizedBox(
                                              width: AppValues.smallPadding),
                                          const Text(
                                            "Face ID",
                                            style: TextStyle(
                                                color: Color(0xffEF0032),
                                                fontSize: 10),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppValues.largePadding,
                          )
                        ],
                      )),
                ),
              ],
            )),
      )
    ]);
  }
}
