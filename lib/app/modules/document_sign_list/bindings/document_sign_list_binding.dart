import 'package:get/get.dart';
import 'package:htds_mobile/app/modules/document_sign_list/controllers/document_sign_list_controller.dart';
import 'package:htds_mobile/app/modules/document_sign_list/widgets/general_lookup/general_lookup_controller.dart';


class DocumentSignListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentSignListController>(
      () => DocumentSignListController(),
    );
    Get.lazyPut<GeneralLookupController>(
          () => GeneralLookupController()
    );
  }
}
