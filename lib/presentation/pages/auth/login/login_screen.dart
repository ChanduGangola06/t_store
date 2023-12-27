import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/styles/spacing_styles.dart';
import 'package:t_store/core/utils/constants/sizes.dart';
import 'package:t_store/core/utils/constants/text_strings.dart';
import 'package:t_store/presentation/pages/auth/login/widgets/login_form.dart';
import 'package:t_store/presentation/pages/auth/login/widgets/login_header.dart';
import 'package:t_store/presentation/pages/auth/register/register_screen.dart';
import 'package:t_store/presentation/widgets/login_signup/form_divider.dart';
import 'package:t_store/presentation/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///  Logo, Title & Sub-Title
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              /// Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const RegisterScreen()),
                    child: const Text(TTexts.createAccount)),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
