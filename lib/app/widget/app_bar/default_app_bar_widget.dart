import 'package:flutter/material.dart';
import 'package:holidayapp/app/constant/resources/app_colors.dart';
import 'package:holidayapp/app/constant/resources/app_dimens.dart';
import 'package:holidayapp/app/widget/primary_text_widget.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;
  final BuildContext? context;
  final double height;
  final IconData? trillingIcon;
  final Function? trillingIconOnClick;

  const DefaultAppBar({
    Key? key,
    required this.title,
    this.showBackArrow = true,
    this.context,
    this.height = 50,
    this.trillingIcon,
    this.trillingIconOnClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        title: PrimaryTextWidget(
          title,
          textSize: AppDimens.TEXT_REGULAR_3X,
          fontWeight: FontWeight.bold,
          textColor: AppColors.secondaryColor,
        ),
        surfaceTintColor: AppColors.whiteColor,
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: showBackArrow,
        elevation: 1.0,
        actions: [
          trillingIcon != null
              ? IconButton(
                  onPressed: () => trillingIconOnClick!(),
                  icon: Icon(trillingIcon))
              : const SizedBox()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
