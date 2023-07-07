
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class DocumentSignListController extends BaseController {
  final appbarText = "".obs;
  @override
  void onInit() {
    super.onInit();
    numberOfTab.value = 2;
  }
}
