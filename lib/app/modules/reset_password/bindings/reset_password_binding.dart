import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/reset_password/controllers/reset_password_controller.dart';


class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
    );
  }
}
