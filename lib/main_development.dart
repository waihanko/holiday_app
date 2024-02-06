import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holidayapp/app/core/config/flavour_manager.dart';
import 'package:holidayapp/app/data_sources/local/cache_manager.dart';
import 'package:holidayapp/main_app.dart';
import 'app/core/config/flavors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<CacheManager>(() async => CacheManager().init());
  // await FirebaseService().initializeFirebase();
  await FlavourManager().init(Flavor.development);
  runApp(
    const MyApp(),
  );
}
