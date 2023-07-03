import 'package:flutter/material.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';
import 'package:htds_mobile/app/core/widget/form/custom_text_field.dart';

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
        Container(
          padding: const EdgeInsets.all(AppValues.largePadding),
          child: const Column(
            children: [
              CustomTextField(
                formControlName: "searchKey",
                suffixIcon: Icon(
                  Icons.clear,
                  size: 30,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        const Icon(Icons.directions_transit),
      ],
    );
  }
}
