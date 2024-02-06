import 'package:get/get.dart';
import 'package:holidayapp/app/core/base/base_controller.dart';
import 'package:holidayapp/app/core/utils/date_utils.dart';
import 'package:holidayapp/app/data_models/responses/holiday_list_response.dart';
import 'package:holidayapp/app/data_sources/network/home_feature/home_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../constant/enum/view_state.dart';
import '../../../core/utils/app_utils.dart';
import '../../../data_models/base_response/base_api_response.dart';
import '../../../data_models/responses/country_list_response.dart';
import '../../../data_sources/network/home_feature/home_repository_impl.dart';

class HomeController extends BaseController {
  late final HomeRepository _repository = HomeRepositoryImpl();
  RxList<CountryListResponse> countryList = RxList.empty();
  RxList<HolidayListResponse> holidayList = RxList.empty();

  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = DateTime.now().obs;
  RefreshController refreshController = RefreshController();
  Rx<CountryListResponse> selectedCountry = CountryListResponse().obs;

  @override
  void onInit() {
    super.onInit();
    fromDate.value = DateTime.now();
    toDate.value = fromDate.value.add(const Duration(days: 60));

    getHolidayList();
    getCountryList();
  }

  //#region API Call
  Future<void> resetAndGetHolidayList() async {
    holidayList.clear();
    getHolidayList();
  }

  void getHolidayList() async {
    holidayList.clear();
    String from =
        DateUtil.formatDate(DateUtil.yearMonthDateWithMinus, fromDate.value);
    String to =
        DateUtil.formatDate(DateUtil.yearMonthDateWithMinus, toDate.value);

    final repoService = _repository.getHolidayList(
      selectedCountry.value.isoCode??"AL",
      from,
      to,
    );
    updatePageState(ViewState.LOADING);
    await callAPIService(
      repoService,
      onSuccess: (dynamic response) {
        resetRefreshController(refreshController);
        if (response != null) {
          BaseApiResponse<HolidayListResponse> holidayData = response;
          holidayList.value = holidayData.listResult;
          if (holidayList.isEmpty) {
            Future.delayed(
              const Duration(seconds: 1),
              () => updatePageState(ViewState.EMPTY_LIST),
            );
          }
        }
      },
      onError: (exception) {
        resetRefreshController(refreshController);
        if (holidayList.isEmpty) {
          updatePageState(
            ViewState.FAILED,
            onClickTryAgain: () => resetAndGetHolidayList(),
          );
        } else {
          AppUtils.showToast(exception.message);
        }
        return;
      },
    );
  }

  void getCountryList() async {
    final repoService = _repository.getCountryList();
    await callAPIService(
      repoService,
      onSuccess: (dynamic response) {
        if (response != null) {
          BaseApiResponse<CountryListResponse> countryData = response;
          countryList.value = countryData.listResult;
          if (countryList.isEmpty) {}
        }
      },
      onError: (exception) {
        return;
      },
    );
  }

  void setFromDate(DateTime? value) {
    fromDate.value = value ?? DateTime.now();
    getHolidayList();
  }

  void setToDate(DateTime? value) {
    toDate.value = value ?? DateTime.now();
    getHolidayList();
  }

  void selectCountry(CountryListResponse country) {
    selectedCountry.value = country;
    getHolidayList();
  }
}
