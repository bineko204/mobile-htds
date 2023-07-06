
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/data/local/preference/preference_manager.dart';

import '../../../../core/model/document.dart';
import '../../../../core/values/app_values.dart';
import '../view_report_popup/view_report_popup.dart';

class DetailPopup extends StatefulWidget {
  final Map<String, dynamic> data;
  late Document documentData;
  String signType = "cloud";
  final PreferenceManager _preferenceManager = Get.find(tag: (PreferenceManager).toString());
  DetailPopup({super.key, required this.data}) {
    documentData = Document.fromJson(data);
    getSignType();
  }
   getSignType() async {
    String result = await _preferenceManager.getString('signType');
    signType = result;
   }

  @override
  State<DetailPopup> createState() => _DetailPopupState();
}

class _DetailPopupState extends State<DetailPopup> {

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
          _dialogContentItem("Kỳ đối soát", widget.documentData.name ?? ""),
          _dialogContentItem("Dịch vụ", widget.documentData.partner ?? ""),
          _dialogContentItem("Đối tác", widget.documentData.type ?? ""),
          _dialogContentItem("Hợp đồng", widget.documentData.label ?? ""),
          _dialogContentItem("Trạng thái", "Tháng 1"),
          _dialogContentItem("Ngày ký duyệt", "Tháng 1"),
          _dialogContentItem("Người ký duyệt", "Tháng 1"),
        ],
      ),
    );
  }

  Widget _dialogContentItem(String label, String data) {
    return Padding(
      padding: const EdgeInsets.only(top: AppValues.smallPadding),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          Text(" : ", style: const TextStyle(fontSize: 14),),
          Text(
            data,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }

  List<Widget> _listAction() {
    return [
      _signButton(),
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("View report",
                  style: TextStyle(color: Colors.black, fontSize: 12)),
              SvgPicture.asset(
                "images/pdf.svg",
                width: 16,
                height: 16,
                fit: BoxFit.fitWidth,
              )
            ],
          )),
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
    ];
  }

  Widget _signButton() {
    return InkWell(
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
                        widget.signType == "cloud" ? "Ký cloud CA" : "Ký sim CA",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
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
                initialValue: widget.signType,
                // Callback that sets the selected popup menu item.
                onSelected: (item) {
                  widget._preferenceManager.setString('signType', item);
                  setState(() {
                    widget.signType = item;
                  });
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
                        child:
                            Text("Ký sim CA", style: TextStyle(fontSize: 12))),
                  ];
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
