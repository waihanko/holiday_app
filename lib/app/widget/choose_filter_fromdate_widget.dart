
import 'package:flutter/material.dart';
import 'package:holidayapp/app/widget/primary_text_widget.dart';

import '../constant/resources/app_colors.dart';
import '../constant/resources/app_dimens.dart';
import '../core/utils/date_utils.dart';
import '../features/home/controller/home_controller.dart';

class ChooseFilterFromDateWidget extends StatelessWidget {
  const ChooseFilterFromDateWidget({required this.controller, Key? key}) : super(key: key);
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDatePicker(
          context: context,
          builder: (BuildContext context, Widget? child) {
            return datePickerTheme(child);
          },
          initialDate: controller.fromDate.value,
          firstDate: DateTime(1950),
          lastDate: controller.toDate.value,
        ).then(
              (value) {
            if (value != null) {
              controller.setFromDate(value);
            }
          },
        );
      },
      child: Container(
        padding:
        const EdgeInsets.all(AppDimens.MARGIN_MEDIUM),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimens.MARGIN_MEDIUM,
            ),
            border:
            Border.all(color: AppColors.lightGreyColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryTextWidget(
              "From Date",
              textSize: AppDimens.TEXT_MEDIUM,
              textColor: AppColors.primaryTextColor,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: AppDimens.MARGIN_SMALL,
            ),
            PrimaryTextWidget(
              DateUtil.getFromUTC(DateUtil.dateMonthYearWithDot,
                  "${controller.fromDate.value}"),
              fontWeight: FontWeight.w700,
              textSize: AppDimens.TEXT_REGULAR,
              textColor: AppColors.primaryTextColor,
            ),
          ],
        ),
      ),
    );
  }

  static Theme datePickerTheme(Widget? child) => Theme(
    data: ThemeData(
      primarySwatch: Colors.grey,
      splashColor: Colors.blueAccent,
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: AppColors.primaryColor),
        button: TextStyle(color: AppColors.primaryColor),
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.secondaryColor,
      ),
      dialogBackgroundColor: Colors.white,
    ),
    child: child ?? const SizedBox(),
  );

}
