import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/ui_constants.dart';

final List<String> items = [
  'Mode 1: Interval Based',
  'Mode 2: Time Based',
];
List<String> selectedItems = [];

class Dropdown extends StatelessWidget {
  final String? hintText;
  const Dropdown({
    Key? key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        // Drop items and their design
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final _isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected ? selectedItems.remove(item) : selectedItems.add(item);
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.regular),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item, style: Get.theme.textTheme.bodyText1),
                        _isSelected
                            ? Icon(Icons.radio_button_checked, color: Get.theme.colorScheme.tertiary)
                            : Icon(Icons.radio_button_off, color: Get.theme.colorScheme.tertiary),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        itemPadding: EdgeInsets.zero,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Get.theme.colorScheme.onTertiary,
        ),
        // Dropdown box and design
        hint: Text(
          hintText ?? '',
          style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.colorScheme.tertiary),
        ),
        buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Get.theme.cardColor),
        buttonPadding: const EdgeInsets.symmetric(horizontal: Spacing.regular),
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (value) {},
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: Spacing.regular),
                child: Text(
                  selectedItems.join(', '),
                  style: Get.theme.textTheme.bodyText1,
                  maxLines: 1,
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }
}
