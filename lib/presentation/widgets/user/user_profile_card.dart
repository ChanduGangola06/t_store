import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/core/utils/constants/colors.dart';
import 'package:t_store/data/models/user_model.dart';
import '../images/t_circular_image.dart';

class TUserProfileCard extends StatelessWidget {
  const TUserProfileCard({
    super.key,
    required this.user,
    required this.actionButtonOnPressed,
  });

  final UserModel user;
  final VoidCallback actionButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
          padding: 0,
          image: user.profilePicture,
          width: 50,
          height: 50,
          fit: BoxFit.cover),
      title: Text(
        user.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        user.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: actionButtonOnPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
