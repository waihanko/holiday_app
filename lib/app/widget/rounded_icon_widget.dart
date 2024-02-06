import 'package:flutter/material.dart';

import '../constant/resources/app_colors.dart';
import '../constant/resources/app_dimens.dart';

class RoundedIconWidget extends StatelessWidget {
  final Widget icon;
  final Function onClickIcon;
  final Color splashColor;
  final Color highlightColor;
  final Color backgroundColor;
  final double contentPadding;
  final double borderRadius;

  const RoundedIconWidget({
    Key? key,
    required this.icon,
    this.backgroundColor = Colors.transparent,
    this.splashColor = Colors.transparent,
    this.highlightColor = AppColors.primaryColor,
    this.contentPadding = 12.0,
    this.borderRadius = AppDimens.MARGIN_CARD_MEDIUM,
    required this.onClickIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: ()=> onClickIcon(),
      elevation: 0,
      constraints: const BoxConstraints(), //removes empty spaces around of icon
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ), //circular button,
      highlightElevation: 0,
      fillColor: backgroundColor,
      splashColor: splashColor,
      child: icon,
      padding:  EdgeInsets.all(contentPadding),
    );
  }
}
