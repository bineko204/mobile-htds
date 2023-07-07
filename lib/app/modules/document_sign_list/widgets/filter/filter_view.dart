import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/widget/dropdown_single.dart';
import 'package:htds_mobile/app/modules/document_sign_list/widgets/filter/filter_controller.dart';

import '../../../../core/model/document.dart';
import '../../../../core/values/app_values.dart';
import '../../../../core/widget/dropdown_multiple.dart';

class DocumentSignListFilter extends GetView<DocumentSignListFilterController> {
  final Function? onChange;
  final Map<String, dynamic>? selectedItem;
  DocumentSignListFilter({super.key, this.onChange, this.selectedItem}) {
    Get.lazyPut<DocumentSignListFilterController>(
      () => DocumentSignListFilterController(),
    );
    if (selectedItem != null) {
      controller.selectedPartner(selectedItem!["partner"] ?? []);
      controller.selectedService(selectedItem!["service"] ?? []);
      controller.selectedContract(selectedItem!["contract"] ?? []);
      controller.selectedBillingPeriod(selectedItem!["billingPeriod"] ?? []);
      controller.selectedStatus.value = selectedItem!["status"];
    }
    // controller.selectedPartner([
    //   Document(
    //       name: "123144",
    //       partner: "LU",
    //       status: 1,
    //       label: "123kkk",
    //       value: 1,
    //       type: "Văn bản")
    // ]);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(AppValues.largePadding),
      title: _dialogTitle(),
      content: _dialogContent(),
      actionsAlignment: MainAxisAlignment.start,
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(AppValues.smallPadding),
      actions: _listAction(),
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
            "Tìm kiếm",
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
        child: Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              CustomDropdownSearch(
                label: "Đối tác",
                items: controller.listPartner.value,
                selectedItem: controller.selectedPartner.value,
                onChange: (List<Document> values) {
                  controller.selectedPartner(values);
                },
              ),
              SizedBox(
                height: AppValues.smallPadding,
              ),
              CustomDropdownSearch(
                label: "Dịch vụ",
                items: controller.listService.value,
                selectedItem: controller.selectedService.value,
                onChange: (List<Document> values) {
                  controller.selectedService(values);
                },
              ),
              SizedBox(
                height: AppValues.smallPadding,
              ),
              CustomDropdownSearch(
                label: "Hợp đồng",
                items: controller.listContract.value,
                selectedItem: controller.selectedContract.value,
                onChange: (List<Document> values) {
                  controller.selectedContract(values);
                },
              ),
              SizedBox(
                height: AppValues.smallPadding,
              ),
              CustomDropdownSearch(
                label: "Kỳ cước",
                items: controller.listBillingPeriod.value,
                selectedItem: controller.selectedBillingPeriod.value,
                onChange: (List<Document> values) {
                  controller.selectedBillingPeriod(values);
                },
              ),
              SizedBox(
                height: AppValues.smallPadding,
              ),
              CustomDropdownSingle(
                items: controller.listStatus.value,
                label: "Trạng thái",
                selectedItem: controller.selectedStatus.value,
                onChange: (value) {
                  controller.selectedStatus(value);
                },
              )
            ],
          ),
        ));
  }

  List<Widget> _listAction() {
    return [
      ElevatedButton(
          onPressed: () {
            controller.onChange(onChange);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
          ),
          child: const Text("Tìm kiếm",
              style: TextStyle(color: Colors.black, fontSize: 12))),
    ];
  }
}
