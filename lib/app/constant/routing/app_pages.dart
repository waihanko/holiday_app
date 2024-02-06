import 'package:get/get.dart';
import 'package:holidayapp/app/constant/routing/app_route.dart';
import 'package:holidayapp/app/core/binding/initial_binding.dart';
import 'package:holidayapp/app/features/home/binding/home_binding.dart';
import 'package:holidayapp/app/features/home/screen/home_screen.dart';


class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
        InitialBinding(),
      ],
    ),
  ];
}
