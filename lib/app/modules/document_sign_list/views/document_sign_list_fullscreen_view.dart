import 'package:flutter/material.dart';
import 'package:htds_mobile/app/modules/document_sign_list/widgets/general_lookup/general_lookup_view.dart';

import '/app/core/base/base_view.dart';
import '../controllers/document_sign_list_controller.dart';

class DocumentSignListFullscreenView
    extends BaseView<DocumentSignListController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return GeneralLookupView();
  }
}
