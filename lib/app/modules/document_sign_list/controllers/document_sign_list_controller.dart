import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class DocumentSignListController extends BaseController {
  final appbarText = "".obs;
  final parameter = Get.parameters;
  @override
  void onInit() {
    super.onInit();

    numberOfTab.value = 2;

    final String? type = parameter["type"];
    if (type != null) {
      switch (type) {
        case "0":
          appbarText.value = "Ký biên bản chính thức";
          break;
        case "1":
          appbarText.value = "Ký biên bản bàn giao chi nhánh";
          break;
        case "2":
          appbarText.value = "Ký biên bản phí đầu số";
          break;
        case "3":
          appbarText.value = "Ký biên bản test";
          break;
      }
    }
  }
}
