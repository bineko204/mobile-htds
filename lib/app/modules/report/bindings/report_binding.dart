import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/report/controllers/report_controller.dart';


class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(
      () => ReportController(),
    );
  }
}
