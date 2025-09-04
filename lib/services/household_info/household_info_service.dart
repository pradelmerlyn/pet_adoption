
import 'package:pet_adoption/models/household_info/household_info_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'household_info_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class HouseholdInfoServices {
  factory HouseholdInfoServices({String? baseUrl}) {
    return _HouseholdInfoServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.householdInfo)
  Future<HttpResponse<List<HouseholdInfoModel>>> getAgreement();
}
