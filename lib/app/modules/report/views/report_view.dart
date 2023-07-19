import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';

import '../../../routes/app_pages.dart';
import '/app/core/base/base_view.dart';
import '../controllers/report_controller.dart';

class ReportView extends BaseView<ReportController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  final TreeViewTheme treeViewTheme = TreeViewTheme(
    horizontalSpacing: AppValues.smallPadding,
    levelPadding: AppValues.largePadding,
    verticalSpacing: AppValues.largePadding,
    expanderTheme: const ExpanderThemeData(
        type: ExpanderType.chevron,
        modifier: ExpanderModifier.none,
        position: ExpanderPosition.end,
        // color: Colors.grey.shade800,
        size: 26,
        color: Colors.blue),
    labelStyle: const TextStyle(
      fontSize: 16,
      letterSpacing: 0.3,
    ),
    parentLabelStyle: const TextStyle(
      fontSize: 16,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w800,
    ),
    iconTheme: IconThemeData(
      size: 26,
      color: Colors.grey.shade800,
    ),


  );

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => TreeView(
        theme: treeViewTheme,
        controller: controller.treeViewController.value,
        allowParentSelect: false,
        supportParentDoubleTap: true,
        onExpansionChanged: (key, expanded) => controller.expandNode(key, expanded),
        onNodeTap: (key) {
          debugPrint('Selected: $key');
          Get.toNamed(Routes.REPORT_DETAIL);
        },
      ),
    );
  }
}
