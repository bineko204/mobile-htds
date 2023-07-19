import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';
import 'package:htds_mobile/app/core/widget/custom_app_bar.dart';
import 'package:htds_mobile/app/core/widget/dropdown_single.dart';

import '../../../../core/widget/form/custom_text_field.dart';
import '/app/core/base/base_view.dart';
import 'report_detail_controller.dart';

class ReportDetailView extends BaseView<ReportDetailController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar( appBarTitleText:"Report 1");
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.largePadding),
      child: FormBuilder(
        key: controller.formKey,
        onChanged: () {
          controller.formKey.currentState!.save();
          debugPrint(controller.formKey.currentState!.value.toString());
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(top: AppValues.largePadding),
              child: CustomTextField(
                hintText: "Đối tác",
                formControlName: 'partner',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppValues.largePadding),
              child: CustomTextField(
                hintText: "Đối tác",
                formControlName: 'partner',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppValues.largePadding),
              child: CustomDropdownSingle(
                label: "khanh",
                selectedItem: controller.selectedService.value,
                items: controller.listService.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
