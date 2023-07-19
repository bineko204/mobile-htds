import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/report/pages/report_detail/report_detail_controller.dart';


class ReportDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportDetailController>(
      () => ReportDetailController(),
    );
  }
}
