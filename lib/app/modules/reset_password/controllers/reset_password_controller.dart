import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';

class ResetPasswordController extends BaseController {
  final count = 0.obs;
  final formKey = GlobalKey<FormBuilderState>();
  void increment() => count.value++;
}
