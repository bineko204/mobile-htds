import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/report/controllers/report_controller.dart';

import '/app/modules/favorite/controllers/favorite_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
      fenix: true,
    );
    Get.lazyPut<ReportController>(
      () => ReportController(),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
