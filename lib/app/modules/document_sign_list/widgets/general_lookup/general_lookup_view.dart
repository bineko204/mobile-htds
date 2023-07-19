import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/model/document.dart';
import 'package:htds_mobile/app/core/widget/datatable.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/model/base_search_item.dart';
import '../../../../core/values/app_values.dart';
import '../../../../core/widget/dropdown_multiple.dart';
import '../../../../routes/app_pages.dart';
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
                child: GestureDetector(
                  onTap: () {
                    controller.openFilterPopup();
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppValues.smallPadding / 2,
                        vertical: AppValues.smallPadding / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppValues.radius_6),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: Obx(
                      () => controller.filterCount == 0
                          ? const Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                                Text(
                                  "Tìm kiếm",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          : _renderListSelectedFilter(),
                    ),
                  ),
                ),
              ),
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
              ),
              const SizedBox(width: AppValues.smallPadding),
              InkWell(
                onTap: () {
                  if (Get.currentRoute == Routes.DOCUMENT_SIGN_LIST_FULLSCREEN) {
                    Get.back();
                  } else {
                    Get.toNamed(Routes.DOCUMENT_SIGN_LIST_FULLSCREEN);
                  }
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppValues.radius_6),
                    color: const Color(0xFFE0E0E0),
                  ),
                  padding: const EdgeInsets.all(AppValues.smallPadding),
                  child: SvgPicture.asset(
                    'images/expand.svg',
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
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
                        .where((element) => controller.showPinned.value
                            ? element.status == 1
                            : true)
                        .map((e) => e.toJson())
                        .toList(),
                    headers: controller.headers,
                    rowPress: (data) {
                      print(data.toString());
                    },
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  _renderListSelectedFilter() {
    final List<Document> partner =
        controller.filterData.value?["partner"] ?? [];
    final List<Document> service =
        controller.filterData.value?["service"] ?? [];
    final List<Document> contract =
        controller.filterData.value?["contract"] ?? [];
    final List<Document> billingPeriod =
        controller.filterData.value?["billingPeriod"] ?? [];
    final Document? status = controller.filterData.value?["status"];
    final List<SearchItem> data = List.of([]);
    data.addAll(partner);
    data.addAll(service);
    data.addAll(contract);
    data.addAll(billingPeriod);
    if (status != null) {
      data.add(status);
    }
    return Row(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: data.map((e) => _renderFilterItem(e)).toList(),
          ),
        ),
        InkWell(
          onTap: () {
            controller.clearFilter();
          },
          child: const Icon(
            Icons.clear,
            color: Colors.grey,
            size: 20,
          ),
        )
      ],
    );
  }

  Widget _renderFilterItem(SearchItem data) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.symmetric(horizontal: AppValues.smallPadding),
      decoration: BoxDecoration(
          color: const Color(0xFF616161),
          borderRadius: BorderRadius.circular(AppValues.radius)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.label ?? "",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(
            width: 4,
          ),
          InkWell(
            child: const Icon(
              Icons.clear,
              size: 14,
              color: Colors.white,
            ),
            onTap: () {
              controller.removeItem(data);
            },
          )
        ],
      ),
    );
  }
}
