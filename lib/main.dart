import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDataTable(),
    );
  }
}

class MyDataTable extends StatefulWidget {
  const MyDataTable({super.key});

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  List<String> headerList = [
    "SR.",
    "Name",
    "Math",
    "Science",
    "English",
    "Biology",
    "Physics",
    "Computer",
    "Total",
    "Grade"
  ];

  List<Map<String, dynamic>> rowData = [
    {
      "name": "Sahil",
      "mark": [90, 80, 85, 75, 65, 78],
      "total": 473,
      "grade": "A",
    },
    {
      "name": "Rohit",
      "mark": [89, 79, 84, 74, 64, 77],
      "total": 467,
      "grade": "A",
    },
    {
      "name": "Siddharth",
      "mark": [85, 95, 98, 97, 95, 96],
      "total": 566,
      "grade": "A+",
    },
  ];

  late List<String> centerHeader;
  // make this list for central table and this will scrollable
  // and this will get value in initState()

  @override
  void initState() {
    super.initState();

    // get value from main list
    centerHeader = List.from(headerList);

    // remove first element for not scrolling -> remove "SR." from headerList
    centerHeader.removeAt(0);

    // remove last element for not scrolling -> remove "Grade" from headerList
    centerHeader.removeAt(centerHeader.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // first table -> will give Serial number and count
                DataTable(
                  horizontalMargin: 10,
                  headingRowHeight: 45,
                  headingRowColor:
                  MaterialStateProperty.all(Colors.grey.shade100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // border: Border.all(
                    //   color: Colors.grey,
                    // ),
                  ),
                  dataRowHeight: 40,
                  columnSpacing: 8,
                  dividerThickness: 0,
                  // border: TableBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // ),
                  columns: [
                    DataColumn(
                      label: Text(
                        headerList[0],
                      ),
                    ),
                  ],
                  rows: rowData.map(
                        (e) {
                      final i = rowData.indexOf(e);
                      return DataRow(
                        cells: [
                          DataCell(
                            Text("${1 + i}"),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),

                // cental DataTable which will scrolling
                // here use centerHeader (List)
                // Flexible -> SingleChildScrollView for scrolling purpose
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      horizontalMargin: 10,
                      headingRowHeight: 45,
                      headingRowColor:
                      MaterialStateProperty.all(Colors.grey.shade100),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // border: Border.all(color: Colors.grey),
                      ),
                      dataRowHeight: 40,
                      columnSpacing: 8,
                      dividerThickness: 0,
                      border: TableBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      columns: centerHeader.map(
                            (e) {
                          return DataColumn(
                            label: Text(e),
                          );
                        },
                      ).toList(),
                      rows: rowData.map(
                            (e) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(e['name']),
                              ),
                              ...e['mark']
                                  .map(
                                    (m) => DataCell(
                                  Text("$m"),
                                ),
                              )
                                  .toList(),
                              DataCell(
                                Text("${e['total']}"),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),

                // Last(third) DataTable
                DataTable(
                  horizontalMargin: 10,
                  headingRowHeight: 45,
                  headingRowColor:
                  MaterialStateProperty.all(Colors.grey.shade100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // border: Border.all(
                    //   color: Colors.grey,
                    // ),
                  ),
                  dataRowHeight: 40,
                  columnSpacing: 8,
                  dividerThickness: 0,
                  // border: TableBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // ),
                  columns: [
                    DataColumn(
                      label: Text(headerList.last),
                    )
                  ],
                  rows: rowData.map(
                        (e) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              e['grade'],
                            ),
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}