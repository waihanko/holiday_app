import 'package:holidayapp/app/data_models/base_response/base_api_response.dart';
import 'package:holidayapp/app/data_models/responses/dummy_list_response.dart';

abstract class SampleRepository {
  Future<BaseApiResponse<DummyListResponse>> getDummyData();
}
