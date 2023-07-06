import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/routes/app_pages.dart';
import '../../../../core/values/app_values.dart';

class ViewReportPopup extends StatefulWidget {
  @override
  State<ViewReportPopup> createState() => _ViewReportPopupState();
}

class _ViewReportPopupState extends State<ViewReportPopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(AppValues.largePadding),
      title: _dialogTitle(),
      content: _dialogContent(),
      actionsAlignment: MainAxisAlignment.start,
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(AppValues.smallPadding),
    );
  }

  Widget _dialogTitle() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      padding: const EdgeInsets.all(AppValues.smallPadding),
      child: Row(
        children: [
          const Text(
            "File biên bản",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            width: AppValues.smallPadding,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.clear),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dialogContent() {
    return SizedBox(
      width: Get.width - (AppValues.largePadding * 2),
      child: ListView(
        shrinkWrap: true,
        children: [
          _dialogContentItem("Kỳ đối soát"),
          _dialogContentItem("Dịch vụ"),
          _dialogContentItem("Đối tác"),
          _dialogContentItem("Hợp đồng"),
        ],
      ),
    );
  }

  Widget _dialogContentItem(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: AppValues.smallPadding),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.VIEW_PDF);
        },
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
