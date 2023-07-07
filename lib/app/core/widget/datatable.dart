import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htds_mobile/app/core/values/app_values.dart';

import '../../routes/app_pages.dart';

class DataTableHeader {
  final String? title;
  final String? columnDef;
  final bool? fixedLeft;
  final bool? fixedRight;
  final Function? renderer;
  final double? width;
  DataTableHeader(
      {this.title,
      this.columnDef,
      this.fixedLeft,
      this.fixedRight,
      this.renderer,
      this.width});
}

class MyDataTable extends StatefulWidget {
  final List<DataTableHeader> headers;
  final List<Map<String, dynamic>> columns;
  final int displayColumnNumber;

  const MyDataTable({super.key, required this.headers, required this.columns, this.displayColumnNumber = 4});

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  late List<DataTableHeader> centerHeader;
  DataTableHeader? fixedLeftHeader;
  DataTableHeader? fixedRightHeader;
  late double centerColumnWidth = 100;

  // make this list for central table and this will scrollable
  // and this will get value in initState()

  @override
  void initState() {
    super.initState();
    // get value from main list
    _initHeader();
  }

  _initHeader() {
    centerHeader = List.from(widget.headers);
    if (centerHeader.isNotEmpty) {
      final fixedLeft =
      centerHeader.firstWhereOrNull((element) => element.fixedLeft == true);
      if (fixedLeft != null) {
        final fixedLeftIndex = centerHeader.indexOf(fixedLeft);
        fixedLeftHeader = centerHeader.removeAt(fixedLeftIndex);
      }
      final fixedRight = centerHeader
          .firstWhereOrNull((element) => element.fixedRight == true);
      if (fixedRight != null) {
        final fixedRightIndex = centerHeader.indexOf(fixedRight);
        fixedRightHeader = centerHeader.removeAt(fixedRightIndex);
      }
      centerColumnWidth = _calculateCenterColumnWidth();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.headers.isEmpty) {
      return Container();
    }
    return OrientationBuilder(
      builder: (context, orientation) {
        _initHeader();
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // first table -> will give Serial number and count
            fixedLeftHeader != null
                ? DataTable(
                    horizontalMargin: 10,
                    headingRowHeight: 45,
                    dataRowHeight: 40,
                    columnSpacing: 0,
                    dividerThickness: 0,
                    columns: [
                      DataColumn(
                        label: SizedBox(
                          width: fixedLeftHeader!.width ?? 100,
                          child: Text(
                            fixedLeftHeader?.title ?? "",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                    rows: widget.columns.map(
                      (e) {
                        final data = e[fixedLeftHeader!.columnDef].toString();
                        final index = widget.columns.indexOf(e);
                        return DataRow(
                          cells: [
                            DataCell(
                              SizedBox(
                                width: fixedLeftHeader!.width ?? 100,
                                child: fixedLeftHeader!.renderer != null
                                    ? fixedLeftHeader!.renderer!(e, index)
                                    : Text(
                                        data,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  )
                : Container(),

            // cental DataTable which will scrolling
            // here use centerHeader (List)
            // Flexible -> SingleChildScrollView for scrolling purpose
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  horizontalMargin: 0,
                  headingRowHeight: 45,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5),
                  //   // border: Border.all(color: Colors.grey),
                  // ),
                  dataRowHeight: 40,
                  columnSpacing: 0,
                  dividerThickness: 0,
                  columns: centerHeader.map(
                    (e) {
                      return DataColumn(
                        label: SizedBox(
                          width: centerColumnWidth,
                          child: Text(
                            e.title ?? "",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  rows: widget.columns.map(
                    (col) {
                      final index = widget.columns.indexOf(col);
                      return DataRow(
                          cells: centerHeader
                              .map((header) => DataCell(header.renderer != null
                                  ? header.renderer!(col, index)
                                  : SizedBox(
                                      width: centerColumnWidth,
                                      child: Text(
                                        col[header.columnDef].toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ))))
                              .toList());
                    },
                  ).toList(),
                ),
              ),
            ),

            // Last(third) DataTable
            fixedRightHeader != null
                ? DataTable(
                    horizontalMargin: 10,
                    headingRowHeight: 45,
                    dataRowHeight: 40,
                    columnSpacing: 0,

                    dividerThickness: 0,
                    // border: TableBorder(
                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    columns: [
                      DataColumn(
                        label: SizedBox(
                          width: fixedRightHeader!.width ?? 100,
                          child: Text(
                            fixedRightHeader!.title ?? "",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      )
                    ],
                    rows: widget.columns.map(
                      (col) {
                        final data =
                            col[fixedRightHeader!.columnDef].toString();
                        final index = widget.columns.indexOf(col);
                        return DataRow(
                          cells: [
                            DataCell(
                              SizedBox(
                                width: fixedRightHeader!.width ?? 100,
                                child: fixedRightHeader!.renderer != null
                                    ? fixedRightHeader!.renderer!(col, index)
                                    : Text(
                                        data,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                              ),
                            )
                          ],
                        );
                      },
                    ).toList(),
                  )
                : Container(),
          ],
        );
      }
    );
  }

  double _calculateCenterColumnWidth() {
    final isFullScreen = Get.currentRoute == Routes.DOCUMENT_SIGN_LIST_FULLSCREEN;
    final fixedLeftWidth = fixedLeftHeader?.width ?? 0;
    final fixedRightWidth = fixedRightHeader?.width ?? 0;
    double result = 100;
    result = (Get.width -
            (AppValues.largePadding * 2) // app padding
            -
            (fixedLeftWidth > 0
                ? (fixedLeftWidth + 20)
                : 0) // fixed left + padding header
            -
            (fixedRightWidth > 0
                ? (fixedRightWidth + 20)
                : 0) // fixed right + padding header
        ) /
        (isFullScreen ? centerHeader.length : widget.displayColumnNumber);
    return result;
  }
}
