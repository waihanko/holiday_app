import 'package:flutter/material.dart';

import '../../constant/resources/app_colors.dart';
import '../../constant/resources/app_dimens.dart';
import '../../data_models/responses/holiday_list_response.dart';
import '../primary_text_widget.dart';

class HolidayListItem extends StatelessWidget {
  const HolidayListItem({
    Key? key,
    required this.holidayData,
  }) : super(key: key);

  final HolidayListResponse holidayData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.MARGIN_MEDIUM),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightBlueColor2,
            borderRadius: BorderRadius.circular(AppDimens.MARGIN_MEDIUM)
        ),
        padding: const EdgeInsets.all(
          AppDimens.MARGIN_CARD_MEDIUM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryTextWidget(
              "From ${holidayData.startDate}\t To  ${holidayData.endDate}",
              textSize: AppDimens.TEXT_MEDIUM,
            ),
            const SizedBox(
              height: AppDimens.MARGIN_CARD_MEDIUM_2,
            ),
            PrimaryTextWidget(
              "${holidayData.name?[0].text}",
              fontWeight: FontWeight.bold,
              textSize: AppDimens.TEXT_REGULAR_2X,
            ),
          ],
        ),
      ),
    );
  }
}
