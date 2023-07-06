import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/model/document.dart';
import 'package:htds_mobile/app/core/widget/datatable.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/values/app_values.dart';
import '../../../../core/widget/search.dart';
import 'general_lookup_controller.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class GeneralLookupView extends BaseView<GeneralLookupController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppValues.smallPadding, vertical: AppValues.smallPadding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomDropdownSearch(
                items: controller.listDocument.value,
                selectedItem: controller.listDataSearch.value,
                onChange: (List<Document> values) {
                  controller.listDataSearch.clear();
                  controller.listDataSearch.addAll(values);
                  print(controller.listDataSearch.value);
                },
              )),
              const SizedBox(width: AppValues.smallPadding),
              InkWell(
                child: Obx(
                  () => Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppValues.radius_6),
                      color: const Color(0xffFEEBEF),
                    ),
                    padding: const EdgeInsets.all(AppValues.smallPadding),
                    child: SvgPicture.asset(
                      'images/bookmark.svg',
                      color: controller.showPinned.value
                          ? Colors.red
                          : const Color(0xFF6F767E),
                    ),
                  ),
                ),
                onTap: () {
                  controller.showPinned(!controller.showPinned.value);
                },
              )
            ],
          ),
          SizedBox(
            height: AppValues.smallPadding,
          ),
          Expanded(
            child: ListView(shrinkWrap: true, children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.withOpacity(0.3))),
                child: Obx(
                  () => MyDataTable(
                    columns: controller.listDocument.value
                    .where((element) => controller.showPinned.value ? element.status == 1 : true)
                        .map((e) => e.toJson())
                        .toList(),
                    headers: controller.headers,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
