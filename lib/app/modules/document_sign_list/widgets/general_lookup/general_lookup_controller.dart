import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';

import '../../../../core/model/document.dart';
import '../../../../core/widget/datatable.dart';
import '/app/core/base/base_controller.dart';

class GeneralLookupController extends BaseController {
  final RxList<Document> listDocument = RxList.of([]);
  final RxList<Document> listDataSearch = RxList.of([
    Document(
        name: "123144",
        partner: "LU",
        status: 1,
        label: "123kkk",
        value: 1,
        type: "Văn bản")
  ]);
  final RxBool showPinned = false.obs;
  late List<DataTableHeader> headers = [
    DataTableHeader(
        title: "",
        columnDef: "",
        fixedLeft: true,
        width: 20,
        renderer: _renderFixedLeftColumn),
    DataTableHeader(title: "Name", columnDef: "name"),
    DataTableHeader(title: "Partner", columnDef: "partner"),
    DataTableHeader(title: "status", columnDef: "status"),
    DataTableHeader(title: "label", columnDef: "label"),
    DataTableHeader(title: "value", columnDef: "value"),
    DataTableHeader(title: "", columnDef: "type"),
    DataTableHeader(
        title: "",
        columnDef: "",
        fixedRight: true,
        width: 30,
        renderer: _renderFixedRightColumn),
  ];

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(seconds: 2),
        () => {
              listDocument.addAll([
                Document(
                    name: "123144",
                    partner: "LU",
                    status: 1,
                    label: "123kkk",
                    value: 1,
                    type: "Văn bản"),
                Document(
                    name: "123454",
                    partner: "LU",
                    status: 1,
                    label: "123kk2k",
                    value: 2,
                    type: "Văn bản"),
                Document(
                    name: "123444",
                    partner: "LU",
                    status: 1,
                    label: "123kkxk",
                    value: 3,
                    type: "Văn bản"),
                Document(
                    name: "123442",
                    partner: "LU",
                    status: 1,
                    label: "123kksk",
                    value: 4,
                    type: "Văn bản"),
                Document(
                    name: "123s44",
                    partner: "LU",
                    status: 1,
                    label: "1243kkk",
                    value: 5,
                    type: "Văn bản"),
              ])
            });
  }

  Widget _renderFixedLeftColumn(data, index) {
    return GestureDetector(
      onTap: () {
        print(data.toString());
        listDocument[index].status = 0;
        listDocument.refresh();
      },
      child: SvgPicture.asset(
        'images/bookmark.svg',
        color: data["status"] == 0
            ? const Color(0xFFEF0032)
            : const Color(0xFF9E9E9E),
      ),
    );
  }

  Widget _renderFixedRightColumn(data, index) {
    return GestureDetector(
      onTap: () {
        print(data.toString());
        listDocument[index].status = 1;
        listDocument.refresh();
        Get.dialog(
            AlertDialog(
              insetPadding: const EdgeInsets.all(AppValues.largePadding),
              title: Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                padding: const EdgeInsets.all(AppValues.smallPadding),
                child: Row(
                  children: [
                    const Text(
                      "Chi Tiết biên bản",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: AppValues.smallPadding,
                    ),
                    SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(
                          "images/bookmark.svg",
                          color: Colors.grey,
                        )),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              titlePadding: EdgeInsets.zero,
              content: SizedBox(
                  width: Get.width - (AppValues.largePadding * 2),
                  child: const Text("content")),
            ),
            barrierDismissible: false);
      },
      child: Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(4),
        ),
        child: SvgPicture.asset('images/eye.svg'),
      ),
    );
  }
}
