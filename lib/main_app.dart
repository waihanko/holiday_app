import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holidayapp/app/constant/resources/app_theme.dart';
import 'package:holidayapp/app/constant/routing/app_pages.dart';
import 'package:holidayapp/app/constant/routing/app_route.dart';
import 'package:holidayapp/app/constant/translation/app_translation.dart';
import 'package:holidayapp/app/core/binding/initial_binding.dart';
import 'package:holidayapp/app/core/config/flavors.dart';
import 'package:holidayapp/app/data_sources/local/cache_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: F.title,
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.find<CacheManager>().getLocale(),
      getPages: AppPages.routes,
      theme:  AppThemes.lightTheme,
      darkTheme:  AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      // initialRoute: isLogin ? Routes.homeScreen : Routes.loginScreen,
      initialRoute: Routes.homeScreen,
      initialBinding: InitialBinding(),
    );
  }
}

