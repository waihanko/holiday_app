import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holidayapp/app/core/config/flavors.dart';
import 'package:holidayapp/app/core/config/flavour_manager.dart';
import 'package:holidayapp/app/data_sources/local/cache_manager.dart';
import 'package:holidayapp/main_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<CacheManager>(() async => CacheManager().init());
  await FlavourManager().init(Flavor.local);
  F.appFlavor = Flavor.local;
  runApp(
    const MyApp(),
  );
}
