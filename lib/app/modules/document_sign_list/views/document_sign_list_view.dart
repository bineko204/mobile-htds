import 'package:flutter/material.dart';

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
    return const TabBarView(
      children: [
        Icon(Icons.directions_car),
        Icon(Icons.directions_transit),
      ],
    );
  }
}
