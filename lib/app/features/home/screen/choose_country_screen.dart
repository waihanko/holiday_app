import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holidayapp/app/constant/resources/app_dimens.dart';
import 'package:holidayapp/app/widget/primary_text_widget.dart';

import '../../../core/base/base_view.dart';
import '../../../widget/app_bar/default_app_bar_widget.dart';
import '../controller/home_controller.dart';

class ChooseCountryScreen extends BaseView<HomeController> {
  ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const DefaultAppBar(
      title: "Choose Country",
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView.builder(
      itemCount: controller.countryList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          controller.selectCountry(controller.countryList[index]);
          Get.back();
        },
        child: Container(
          padding: const EdgeInsets.all(AppDimens.MARGIN_MEDIUM_2),
          child: Row(
            children: [
              PrimaryTextWidget(
                "${controller.countryList[index].name?[0].text}",
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                width: AppDimens.MARGIN_MEDIUM,
              ),
              PrimaryTextWidget(
                "${controller.countryList[index].isoCode}",
                fontWeight: FontWeight.w400,
                textSize: AppDimens.TEXT_SMALL,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
