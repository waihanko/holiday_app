import 'package:holidayapp/app/data_models/base_response/base_api_response.dart';

import '../../../data_models/responses/country_list_response.dart';
import '../../../data_models/responses/holiday_list_response.dart';

abstract class HomeRepository {
  Future<BaseApiResponse<CountryListResponse>> getCountryList();
  Future<BaseApiResponse<HolidayListResponse>> getHolidayList(String country, String fromDate, String toDate);
}
