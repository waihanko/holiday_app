import 'package:dio/dio.dart';
import 'package:holidayapp/app/core/base/base_remote_source.dart';
import 'package:holidayapp/app/core/services/dio_provider.dart';
import 'package:holidayapp/app/data_models/base_response/base_api_response.dart';
import 'package:holidayapp/app/data_models/responses/country_list_response.dart';
import 'package:holidayapp/app/data_models/responses/holiday_list_response.dart';
import 'home_repository.dart';

class HomeRepositoryImpl extends BaseRemoteSource implements HomeRepository {
  @override
  Future<BaseApiResponse<CountryListResponse>> getCountryList() async {
    var dioCall =
        dioClient.get("${DioProvider.baseUrl}/Countries?languageIsoCode=EN");
    try {
      return callApiWithErrorParser(dioCall).then(
        (response) => BaseApiResponse<CountryListResponse>.fromListJson(
          response.data,
          createList: (data) => CountryListResponse.fromJson(
            data,
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BaseApiResponse<HolidayListResponse>> getHolidayList(String countryIso, String fromDate, String toDate) async{
    var dioCall =
    dioClient.get("${DioProvider.baseUrl}/PublicHolidays", queryParameters: {
      "countryIsoCode": countryIso,
      "languageIsoCode": "EN",
      "validFrom": fromDate,
      "validTo": toDate
    });
    try {
      return callApiWithErrorParser(dioCall).then(
            (response) => BaseApiResponse<HolidayListResponse>.fromListJson(
          response.data,
          createList: (data) => HolidayListResponse.fromJson(
            data,
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

}
