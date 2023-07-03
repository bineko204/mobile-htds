import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/document_sign_list/controllers/document_sign_list_controller.dart';


class DocumentSignListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentSignListController>(
      () => DocumentSignListController(),
    );
  }
}
