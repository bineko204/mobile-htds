import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/model/document.dart';

import '../../../core/widget/datatable.dart';
import '../../../data/local/preference/preference_manager.dart';
import '/app/core/base/base_controller.dart';
import 'package:path_provider/path_provider.dart';

class ViewPdfController extends BaseController {
  final RxString filePath = "".obs;
  List<DataTableHeader> headers = [
    DataTableHeader(title: "Name", columnDef: "name"),
    DataTableHeader(title: "Partner", columnDef: "partner"),
    DataTableHeader(title: "status", columnDef: "status"),
    DataTableHeader(title: "label", columnDef: "label"),
    DataTableHeader(title: "value", columnDef: "value"),
    DataTableHeader(title: "type", columnDef: "type"),
  ];

  final RxList<Document> listData = RxList.of([
    Document(
        name: "123144",
        partner: "LU",
        status: 1,
        label: "123kkk",
        value: 1,
        type: "Văn bản"),
    Document(
        name: "123454",
        partner: "LU",
        status: 1,
        label: "123kk2k",
        value: 2,
        type: "Văn bản"),
    Document(
        name: "123444",
        partner: "LU",
        status: 1,
        label: "123kkxk",
        value: 3,
        type: "Văn bản"),
    Document(
        name: "123442",
        partner: "LU",
        status: 1,
        label: "123kksk",
        value: 4,
        type: "Văn bản"),
    Document(
        name: "123s44",
        partner: "LU",
        status: 1,
        label: "1243kkk",
        value: 5,
        type: "Văn bản"),
  ]);
  final signType = "cloud".obs;
  final PreferenceManager preferenceManager =
  Get.find(tag: (PreferenceManager).toString());

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }
}
