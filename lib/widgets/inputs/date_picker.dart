import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatelessWidget {
  final Function()? onCancel;
  final Function(Object?)? onSubmit;

  const DatePicker({
    Key? key,
    this.onCancel,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      backgroundColor: Get.theme.colorScheme.onTertiary,
      onSelectionChanged: (_) {},
      selectionMode: DateRangePickerSelectionMode.single,
      initialSelectedDate: DateTime.now(),
      rangeTextStyle: Get.theme.textTheme.bodyText2,
      selectionTextStyle: Get.theme.textTheme.bodyText2,
      showActionButtons: true,
      showNavigationArrow: true,
      showTodayButton: true,
      monthCellStyle: DateRangePickerMonthCellStyle(textStyle: Get.theme.textTheme.bodyText2),
      headerStyle: DateRangePickerHeaderStyle(textStyle: Get.theme.textTheme.bodyText2),
      yearCellStyle: DateRangePickerYearCellStyle(textStyle: Get.theme.textTheme.bodyText2),
      monthViewSettings: DateRangePickerMonthViewSettings(
        viewHeaderStyle: DateRangePickerViewHeaderStyle(textStyle: Get.theme.textTheme.bodyText2),
      ),
      onCancel: onCancel,
      onSubmit: onSubmit,
    );
  }
}
