import 'package:get/get.dart';
import 'package:holidayapp/app/features/sample_feature/binding/sample_binding.dart';


class ViewControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SampleBinding>(
      () => SampleBinding(),
    );
  }
}
