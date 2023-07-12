import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/widget/dropdown_single.dart';
import 'package:htds_mobile/app/data/local/preference/preference_manager.dart';

import '../../../../core/model/document.dart';
import '../../../../core/values/app_values.dart';
import '../../../../core/widget/dropdown_multiple.dart';
import '../../../../core/widget/form/custom_text_field.dart';
import '../view_report_popup/view_report_popup.dart';

class CancelPopup extends StatefulWidget {
  @override
  State<CancelPopup> createState() => _CancelPopupState();
}

class _CancelPopupState extends State<CancelPopup> {
  final formKey = GlobalKey<FormBuilderState>();
  File? selectedFile;
  final List<SearchItem> listReason = [
    SearchItem(value: 1, label: "Lý do 1"),
    SearchItem(value: 2, label: "Lý do 2"),
    SearchItem(value: 3, label: "Lý do 3"),
    SearchItem(value: 4, label: "Lý do 4"),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(AppValues.largePadding),
      title: _dialogTitle(),
      content: _dialogContent(),
      actions: _listAction(),
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
            "Từ chối duyệt biên bản",
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
    return FormBuilder(
      key: formKey,
      onChanged: () {
        formKey.currentState!.save();
        debugPrint(formKey.currentState!.value.toString());
      },
      child: SizedBox(
        width: Get.width - (AppValues.largePadding * 2),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: AppValues.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lý do *",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: AppValues.smallPadding,
                  ),
                  CustomDropdownSingle(
                    items: listReason,
                    selectedItem: listReason[0],
                    onChange: (value) {
                      print(value);
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: AppValues.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ghi chú",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: AppValues.smallPadding,
                  ),
                  CustomTextField(
                    formControlName: 'username',
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppValues.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "File đính kèm",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: AppValues.smallPadding,
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppValues.smallPadding / 2,
                        vertical: AppValues.smallPadding / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppValues.radius_6),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.3))),
                    child: InkWell(
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();
                        if (result != null) {
                          setState(() {
                            selectedFile = File(result.files.single.path!);
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.link_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                          const Expanded(
                            child: Text(
                              "Upload file",
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ),
                          InkWell(onTap: () {}, child: const Icon(
                            Icons.clear,
                            color: Colors.grey,
                            size: 20,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _listAction() {
    return [
      ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
            backgroundColor: Colors.grey.shade300,
          ),
          child: const Text("Từ chối",
              style: TextStyle(color: Colors.black, fontSize: 12))),
      ElevatedButton(
        onPressed: () {
          Get.back();
          Get.dialog(ViewReportPopup(), barrierDismissible: false);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
        ),
        child: const Text("View report",
            style: TextStyle(color: Colors.black, fontSize: 12)),
      )
    ];
  }
}
