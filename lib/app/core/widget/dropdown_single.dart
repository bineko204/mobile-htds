import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dropdown_multiple.dart';


class CustomDropdownSingle<T extends SearchItem> extends StatefulWidget {
  final List<T> items;
  final Function? onChange;
  final T? selectedItem;
  final String? label;
  const CustomDropdownSingle({Key? key, required this.items, this.onChange, this.selectedItem, this.label})
      : super(key: key);

  @override
  State<CustomDropdownSingle<T>> createState() =>
      _CustomDropdownSingleState<T>();
}

class _CustomDropdownSingleState<T extends SearchItem>
    extends State<CustomDropdownSingle<T>> {

  @override
  Widget build(BuildContext context) {
    final popupCustomValidationKey = GlobalKey<DropdownSearchState<T>>();

    return DropdownSearch<T>(
      key: popupCustomValidationKey,
      compareFn: (i, s) => i.value == s.value,
      itemAsString: (item) {
        return item.label ?? item.toString();
      },
      clearButtonProps: const ClearButtonProps(
        isVisible: false,
      ),
      dropdownButtonProps: const DropdownButtonProps(isVisible: true),
      items: widget.items,
      popupProps: PopupPropsMultiSelection.menu(
        showSearchBox: false,
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
      onChanged: (T? values) {
        if (widget.onChange != null) {
          widget.onChange!(values);
        }
      },
      selectedItem: widget.selectedItem,
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
