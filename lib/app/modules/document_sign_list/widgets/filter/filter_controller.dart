
import 'package:get/get.dart';

import '../../../../core/model/document.dart';
import '/app/core/base/base_controller.dart';

class DocumentSignListFilterController extends BaseController {
  final RxList<Document> listPartner = RxList.of([
    Document(
        name: "partner1",
        partner: "LU",
        status: 1,
        label: "partner1",
        value: 1,
        type: "partner"),
    Document(
        name: "partner2",
        partner: "LU2",
        status: 0,
        label: "partner2",
        value: 2,
        type: "partner"),
  ]);
  final RxList<Document> listService = RxList.of([
    Document(
        name: "service 1",
        partner: "LU",
        status: 1,
        label: "service 1",
        value: 1,
        type: "service"),
    Document(
        name: "service 2",
        partner: "LU",
        status: 1,
        label: "service 2",
        value: 2,
        type: "service"),
  ]);
  final RxList<Document> listContract = RxList.of([
    Document(
        name: "contract 1",
        partner: "LU",
        status: 1,
        label: "contract 1",
        value: 1,
        type: "contract"),
    Document(
        name: "contract 2",
        partner: "LU",
        status: 0,
        label: "contract 2",
        value: 2,
        type: "contract"),
  ]);
  final RxList<Document> listBillingPeriod = RxList.of([
    Document(
        name: "Billing period 1",
        partner: "LU",
        status: 1,
        label: "Billing Period 1",
        value: 1,
        type: "billingPeriod"),
    Document(
        name: "Billing period 2",
        partner: "LU",
        status: 1,
        label: "Billing Period 2",
        value: 2,
        type: "billingPeriod"),
  ]);
  final RxList<Document> listStatus = RxList.of([
    Document(
        name: "status 1",
        partner: "LU",
        status: 1,
        label: "status 1",
        value: 1,
        type: "status"),
    Document(
        name: "status 2",
        partner: "LU",
        status: 1,
        label: "status 2",
        value: 1,
        type: "status"),
  ]);
  final RxList<Document> selectedPartner = RxList.of([]);
  final RxList<Document> selectedService = RxList.of([]);
  final RxList<Document> selectedContract = RxList.of([]);
  final RxList<Document> selectedBillingPeriod = RxList.of([]);
  final Rxn<Document> selectedStatus = Rxn<Document>(null);


  onChange(callback) {
    if (callback == null) {
      return;
    }
    final result = {
      "partner": selectedPartner.value,
      "service": selectedService.value,
      "contract": selectedContract.value,
      "billingPeriod": selectedBillingPeriod.value,
      "status": selectedStatus.value,
    };
    callback(result);
    Get.back();
  }
}
