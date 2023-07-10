
import 'package:get/get.dart';

import '../../../core/widget/dropdown_multiple.dart';
import '../../../routes/app_pages.dart';
import '/app/core/base/base_controller.dart';

class HomeController extends BaseController {

  final RxnInt selectedIndex = RxnInt(null);

  final List<SearchItem> items = [
    SearchItem(label: "Ký biên bản chính thức", value: Routes.DOCUMENT_SIGN_LIST),
    SearchItem(label: "Ký biên bản bàn giao chi nhánh", value: Routes.DOCUMENT_SIGN_LIST),
    SearchItem(label: "Ký biên bản phí đầu số", value: Routes.DOCUMENT_SIGN_LIST),
    SearchItem(label: "Ký biên bản test", value: Routes.DOCUMENT_SIGN_LIST),
  ];
}
