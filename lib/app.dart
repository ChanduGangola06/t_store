import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utils/theme/theme.dart';
import 'package:t_store/presentation/bindings/general_bindings.dart';
import 'package:t_store/presentation/pages/onboard/onboard_screen.dart';
import 'core/utils/constants/text_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const OnboardingScreen(),
    );
  }
}
