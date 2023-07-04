
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SearchItem {
  String? label;
  String? type;
  int? value;
  SearchItem({this.label,this.value, this.type});
}

class CustomDropdownSearch<T extends SearchItem> extends StatelessWidget {
  final List<T> items;
  final RxList<T> selectedItem;
  const CustomDropdownSearch({Key? key, required this.items, required this.selectedItem}) : super(key: key);

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
      dropdownButtonProps: const DropdownButtonProps(
          isVisible: false
      ),
      items: items,
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
                  popupCustomValidationKey.currentState
                      ?.popupOnValidate();
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
                hintText: "Nhập tên"
            )
        ),
        itemBuilder: (ctx, item, isSelected) {
          // const title = getProperty(item, name)
          return ListTile(
            selected: isSelected,
            title: Text(item.label ?? item.toString()),
            dense: true,
            trailing: Text(item.type ?? "", style: const TextStyle(fontSize: 12),),
          );
        },
      ),
      onChanged: (List<T> values) {
        selectedItem.clear();
        selectedItem.addAll(values);
      },
      selectedItems: selectedItem.value,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 12, top: 12),
            prefixIcon: selectedItem.isNotEmpty ? null : const Icon(Icons.search, size: 30,),
            hintText: "Tìm kiếm",
            isDense: true,
            hintStyle: const TextStyle(fontSize: 14),
            border: const OutlineInputBorder()),
      ),
    );
  }
}
