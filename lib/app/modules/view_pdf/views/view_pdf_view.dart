import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';
import '../controllers/view_pdf_controller.dart';

class ViewPdfView extends BaseView<ViewPdfController> {
  final String viewParam;
  late PDFViewController pdfViewController;
  ViewPdfView({this.viewParam = ""}) {
    controller.fromAsset("images/cv.pdf", 'test-file.pdf').then((value) {
      controller.filePath.value = value.path;
    });
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: "viewParam.pdf",
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.clear),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.upload),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return controller.filePath.value != "" ? PDFView(
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
    ) : Container();
  }


}
