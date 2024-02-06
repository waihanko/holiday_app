import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holidayapp/app/core/base/base_view.dart';
import 'package:holidayapp/app/features/home/controller/home_controller.dart';
import 'package:holidayapp/app/widget/choose_filter_fromdate_widget.dart';

import '../../../constant/resources/app_dimens.dart';
import '../../../widget/app_bar/default_app_bar_widget.dart';
import '../../../widget/choose_country_widget.dart';
import '../../../widget/choose_filter_todate_widget.dart';
import '../../../widget/list_item/holiday_list_item.dart';
import '../../../widget/view_handling/smart_refresher_parent_view.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const DefaultAppBar(
      title: "Holiday App",
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(AppDimens.MARGIN_MEDIUM_2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChooseCountryWidget(
              selectedCountry: controller.selectedCountry.value.name?[0].text,
            ),
            const SizedBox(
              height: AppDimens.MARGIN_MEDIUM,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ChooseFilterFromDateWidget(
                      controller: controller,
                    )),
                const SizedBox(
                  width: AppDimens.MARGIN_CARD_MEDIUM,
                ),
                Expanded(
                    flex: 1,
                    child: ChooseFilterToDateWidget(
                      controller: controller,
                    )),
              ],
            ),
            const SizedBox(
              height: AppDimens.MARGIN_LARGE,
            ),
            Flexible(
              child: SmartRefresherParentView(
                refreshController: controller.refreshController,
                enablePullUp: false,
                onRefresh: () => controller.resetAndGetHolidayList(),
                child: CustomScrollView(slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return HolidayListItem(
                          holidayData: controller.holidayList[index],
                        );
                      },
                      childCount: controller.holidayList.length,
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
