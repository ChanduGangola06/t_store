import 'package:flutter/material.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import '../appbar/appbar.dart';
import '../products/cart/cart_menu_icon.dart';

class TUserAppBarProfileCard extends StatelessWidget {
  const TUserAppBarProfileCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.actionButtonOnPressed,
    required this.userCardOnPressed,
  });

  final String title, subTitle;
  final VoidCallback actionButtonOnPressed, userCardOnPressed;

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      showBackArrowIcon: false,
      title: GestureDetector(
        onTap: userCardOnPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey),
            ),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
          ],
        ),
      ),
      actions: [
        TCartMenuIcon(
            iconColor: TColors.white, onPressed: actionButtonOnPressed),
      ],
    );
  }
}
