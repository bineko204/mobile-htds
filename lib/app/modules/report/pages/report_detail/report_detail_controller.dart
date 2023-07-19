import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:htds_mobile/app/core/widget/dropdown_multiple.dart';

import '../../../../core/model/base_search_item.dart';
import '/app/core/base/base_controller.dart';

class ReportDetailController extends BaseController {
  final formKey = GlobalKey<FormBuilderState>();
  final RxList<SearchItem> listService = RxList.of([
    SearchItem(label: "Dịch vụ 1", value: 1),
    SearchItem(label: "Dịch vụ 2", value: 2),
  ]);

  late final Rxn<SearchItem> selectedService = Rxn<SearchItem>(null);
}
