import 'package:pet_adoption/models/personal_info/personal_info_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'personal_info_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class PersonalInfoServices {
  factory PersonalInfoServices({String? baseUrl}) {
    return _PersonalInfoServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.personalInfo)
  Future<HttpResponse<List<PersonalInfoModel>>> getPersonalInfo();
}
