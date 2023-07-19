import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '/app/core/base/base_controller.dart';

class ReportController extends BaseController {
  final List<Node> nodes = [
    const Node(
      label: 'documents',
      key: 'docs',
      expanded: false,
      icon: Icons.folder,
      iconColor: Colors.pinkAccent,
      children: [
        Node(
          label: 'personal',
          key: 'd3',
          icon: Icons.folder,
          children: [
            Node(
              label: 'Poems.docx',
              key: 'pd1',
              icon: Icons.insert_drive_file,
            ),
            Node(
              label: 'Job Hunt',
              key: 'jh1',
              icon: Icons.folder,
              iconColor: Colors.pinkAccent,
              children: [
                Node(
                  label: 'Resume.docx',
                  key: 'jh1a',
                  icon: Icons.insert_drive_file,
                ),
                Node(
                  label: 'Cover Letter.docx',
                  key: 'jh1b',
                  icon: Icons.insert_drive_file,
                ),
              ],
            ),
          ],
        ),
        Node(
          label: 'Inspection.docx',
          key: 'd1',
//          icon: Icons.insert_drive_file),
        ),
        Node(label: 'Invoice.docx', key: 'd2', icon: Icons.insert_drive_file),
      ],
    ),
    const Node(
        label: 'MeetingReport.xls',
        key: 'mrxls',
        icon: Icons.insert_drive_file),
    Node(
        label: 'MeetingReport.pdf',
        key: 'mrpdf',
        iconColor: Colors.green.shade300,
        selectedIconColor: Colors.white,
        icon: Icons.insert_drive_file),
    const Node(label: 'Demo.zip', key: 'demo', icon: Icons.archive)
  ];

  late final Rx<TreeViewController> treeViewController = TreeViewController(
    children: nodes,
  ).obs;





  expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint(msg);
    Node node = treeViewController.value.getNode(key)!;
    if (node != null) {
      List<Node> updated;
      updated =
          treeViewController.value.updateNode(key, node.copyWith(expanded: expanded));
      treeViewController(treeViewController.value.copyWith(children: updated));
      treeViewController.refresh();
    }
  }
}
