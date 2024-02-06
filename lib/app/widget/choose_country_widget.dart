import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holidayapp/app/widget/primary_text_widget.dart';

import '../constant/resources/app_colors.dart';
import '../constant/resources/app_dimens.dart';
import '../features/home/screen/choose_country_screen.dart';

class ChooseCountryWidget extends StatelessWidget {
  const ChooseCountryWidget({
    this.selectedCountry,
    Key? key,
  }) : super(key: key);
  final String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.to(() => ChooseCountryScreen(), fullscreenDialog: true);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppDimens.MARGIN_MEDIUM),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimens.MARGIN_MEDIUM,
            ),
            border: Border.all(color: AppColors.lightGreyColor)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrimaryTextWidget(
                  "Choose Country",
                  textSize: AppDimens.TEXT_MEDIUM,
                  textColor: AppColors.lightGreyColor,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: AppDimens.MARGIN_SMALL,
                ),
                PrimaryTextWidget(
                  selectedCountry ?? "Albania",
                  fontWeight: FontWeight.w700,
                  textSize: AppDimens.TEXT_REGULAR,
                  textColor: AppColors.primaryTextColor,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.navigate_next_rounded,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
