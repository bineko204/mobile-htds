import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/login/controllers/login_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
