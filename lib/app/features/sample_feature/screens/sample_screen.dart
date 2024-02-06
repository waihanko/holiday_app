import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holidayapp/app/constant/resources/app_dimens.dart';
import 'package:holidayapp/app/core/base/base_view.dart';
import 'package:holidayapp/app/features/sample_feature/controller/sample_controller.dart';
import 'package:holidayapp/app/widget/app_bar/default_app_bar_widget.dart';
import 'package:holidayapp/app/widget/text_view_widget.dart';
import 'package:holidayapp/app/widget/view_handling/smart_refresher_parent_view.dart';


class SampleScreen extends BaseView<SampleController> {
  SampleScreen({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(58),
      child: DefaultAppBar(title: "Sample"),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Flexible(
            child: SmartRefresherParentView(
              refreshController: controller.refreshController,
              enablePullUp: true,
              onRefresh: () => controller.resetAndGetDummyList(),
              onLoading: () => controller.getDummyList(),
              child: CustomScrollView(slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(
                          AppDimens.MARGIN_MEDIUM,
                        ),
                        height: 80,
                        color: const Color(0xffe45c5c),
                        child: Center(
                          child: TextViewWidget(
                            controller.dummies[index].mapTitle!,
                            textColor: Colors.white,
                            fontWeight: FontWeight.bold,
                            textSize: AppDimens.TEXT_REGULAR_2X,
                          ),
                        ),
                      );
                    },
                    childCount: controller.dummies.length,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
