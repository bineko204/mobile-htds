
import 'package:get/get.dart';

import '../../../core/model/document.dart';
import '/app/core/base/base_controller.dart';

class DocumentSignListController extends BaseController {
  final appbarText = "".obs;
  final parameter = Get.parameters;
  final RxList<Document> listDataSearch = RxList.of([Document(name: "123144", partner: "LU", status: 1, label: "123kkk", value: 1, type: "Văn bản")]);
  final RxList<Document> listDocument = RxList.of([
    Document(name: "123144", partner: "LU", status: 1, label: "123kkk", value: 1, type: "Văn bản"),
    Document(name: "123454", partner: "LU", status: 1, label: "123kk2k", value: 2, type: "Văn bản"),
    Document(name: "123444", partner: "LU", status: 1, label: "123kkxk", value: 3, type: "Văn bản"),
    Document(name: "123442", partner: "LU", status: 1, label: "123kksk", value: 4, type: "Văn bản"),
    Document(name: "123s44", partner: "LU", status: 1, label: "1243kkk", value: 5, type: "Văn bản"),
  ]);
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
