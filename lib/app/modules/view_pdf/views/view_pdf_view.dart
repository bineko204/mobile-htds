import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';

import '../../../core/widget/datatable.dart';
import '../../../data/local/preference/preference_manager.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '../controllers/view_pdf_controller.dart';

class ViewPdfView extends BaseView<ViewPdfController> {
  final String viewParam;
  late PDFViewController pdfViewController;

  getSignType() async {
    String result = await controller.preferenceManager.getString('signType');
    controller.signType(result);
  }

  ViewPdfView({this.viewParam = ""}) {
    controller.fromAsset("images/cv.pdf", 'test-file.pdf').then((value) {
      controller.filePath.value = value.path;
    });
    getSignType();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: "viewParam.pdf",
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.clear),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.upload),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    if (controller.filePath.value == "") return Container();
    return Column(
      children: [_buildPdfViewer(), _buildBottomTable(), _listAction()],
    );
  }

  Widget _buildPdfViewer() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
            left: AppValues.smallPadding,
            top: AppValues.largePadding,
            right: AppValues.smallPadding),
        color: Colors.grey.shade200,
        child: PDFView(
          filePath: controller.filePath.value,
          autoSpacing: true,
          enableSwipe: true,
          pageSnap: true,
          swipeHorizontal: false,
          onError: (error) {
            print(error);
          },
          onPageError: (page, error) {
            print('$page: ${error.toString()}');
          },
          onViewCreated: (PDFViewController vc) {
            pdfViewController = vc;
          },
        ),
      ),
    );
  }

  Widget _buildBottomTable() {
    return Container(
      color: Colors.grey.shade200,
      child: ExpansionTile(
        iconColor: Colors.black,
        title: const Text(
          'Thông tin doanh thu',
          style: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(
                  left: AppValues.smallPadding,
                  right: AppValues.smallPadding,
                  bottom: AppValues.smallPadding),
              color: Colors.white,
              height: Get.height * 0.3,
              child: ListView(children: [
                MyDataTable(
                    headers: controller.headers,
                    columns: controller.listData
                        .map((element) => element.toJson())
                        .toList())
              ]))
        ],
      ),
    );
  }

  Widget _listAction() {
    return Padding(
      padding: const EdgeInsets.all(AppValues.smallPadding),
      child: Row(
        children: [
          _signButton(),
          SizedBox(width: AppValues.smallPadding,),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
                backgroundColor: Colors.grey.shade300,
              ),
              child: const Text("Từ chối",
                  style: TextStyle(color: Colors.black, fontSize: 12))),
          SizedBox(width: AppValues.smallPadding,),
          InkWell(
            onTap: () {},
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(AppValues.radius_6)),
              child: const Icon(
                Icons.history,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _signButton() {
    return Obx(
      () => InkWell(
        onTap: () {
          print('tappp');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppValues.radius_6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 32,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      border: Border(right: BorderSide(color: Colors.white70))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.smallPadding),
                      child: Text(
                          controller.signType.value == "cloud"
                              ? "Ký cloud CA"
                              : "Ký sim CA",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                    ),
                  )),
              Container(
                width: 32,
                height: 32,
                color: Colors.red,
                child: PopupMenuButton(
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  initialValue: controller.signType.value,
                  // Callback that sets the selected popup menu item.
                  onSelected: (item) {
                    controller.preferenceManager.setString('signType', item);
                    controller.signType(item);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                          height: 32,
                          padding: EdgeInsets.all(AppValues.smallPadding),
                          value: "cloud",
                          child: Text(
                            "Ký cloud CA",
                            style: TextStyle(fontSize: 12),
                          )),
                      const PopupMenuItem(
                          height: 32,
                          padding: EdgeInsets.all(AppValues.smallPadding),
                          value: "sim",
                          child: Text("Ký sim CA",
                              style: TextStyle(fontSize: 12))),
                    ];
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
