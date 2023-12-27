import 'package:flutter/material.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/core/utils/helpers/helper_functions.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.darkGrey
                    : TColors.grey,
                thickness: 0.5,
                endIndent: 5,
                indent: 60)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.darkGrey
                    : TColors.grey,
                thickness: 0.5,
                endIndent: 60,
                indent: 5)),
      ],
    );
  }
}
