
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';
import 'package:htds_mobile/app/core/widget/search.dart';
import 'package:htds_mobile/app/modules/document_sign_list/widgets/general_lookup/general_lookup_view.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '../controllers/document_sign_list_controller.dart';

class DocumentSignListView extends BaseView<DocumentSignListController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
        appBarTitleText: controller.appbarText.value,
        bottom: const TabBar(
          tabs: [
            Tab(
              child: Text(
                "Tra cứu chung",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                "Đã ký duyệt",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ));
  }

  @override
  Widget body(BuildContext context) {
    return TabBarView(
      children: [
        GeneralLookupView(),
        const Icon(Icons.directions_transit),
      ],
    );
  }
}
