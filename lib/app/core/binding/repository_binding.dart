import 'package:get/get.dart';
import 'package:holidayapp/app/data_sources/network/sample_feature/sample_repository.dart';
import 'package:holidayapp/app/data_sources/network/sample_feature/sample_repository_impl.dart';


class RepositoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleRepository>(
      () => SampleRepositoryImpl(),
    );
  }
}
