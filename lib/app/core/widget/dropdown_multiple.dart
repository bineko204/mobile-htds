import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class SearchItem {
  String? label;
  String? type;
  dynamic? value;

  SearchItem({this.label, this.value, this.type});
}

class CustomDropdownSearch<T extends SearchItem> extends StatefulWidget {
  final List<T> items;
  final Function? onChange;
  final List<T>? selectedItem;
  final String? label;
  const CustomDropdownSearch({Key? key, required this.items, this.onChange, this.selectedItem, this.label})
      : super(key: key);

  @override
  State<CustomDropdownSearch<T>> createState() =>
      _CustomDropdownSearchState<T>();
}

class _CustomDropdownSearchState<T extends SearchItem>
    extends State<CustomDropdownSearch<T>> {

  @override
  Widget build(BuildContext context) {
    final popupCustomValidationKey = GlobalKey<DropdownSearchState<T>>();

    return DropdownSearch<T>.multiSelection(
      key: popupCustomValidationKey,
      compareFn: (i, s) => i.value == s.value,
      itemAsString: (item) {
        return item.label ?? item.toString();
      },
      clearButtonProps: const ClearButtonProps(
        isVisible: true,
      ),
      dropdownButtonProps: const DropdownButtonProps(isVisible: false),
      items: widget.items,
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: true,
        showSelectedItems: true,
        validationWidgetBuilder: (ctx, selectedItems) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  popupCustomValidationKey.currentState?.popupOnValidate();
                },
                child: const Text("Tìm kiếm"),
              ),
            ),
          );
        },
        searchFieldProps: const TextFieldProps(
            decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                hintText: "Nhập tên")),
        itemBuilder: (ctx, item, isSelected) {
          // const title = getProperty(item, name)
          return ListTile(
            selected: isSelected,
            title: Text(item.label ?? item.toString()),
            dense: true,
            trailing: Text(
              item.type ?? "",
              style: const TextStyle(fontSize: 12),
            ),
          );
        },
      ),
      onChanged: (List<T> values) {
        if (widget.onChange != null) {
          widget.onChange!(values);
        }
      },
      selectedItems: widget.selectedItem ?? [],
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 12, top: 12),
            labelText: widget.label,
            labelStyle: TextStyle(fontSize: 12),
            isDense: true,
            hintStyle: const TextStyle(fontSize: 12),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
