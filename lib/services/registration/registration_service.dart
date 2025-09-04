import 'package:pet_adoption/models/registration/registration_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'registration_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class RegistrationService {
  factory RegistrationService({String? baseUrl}) {
    return _RegistrationService(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.userRegister)
  Future<HttpResponse<List<RegistrationModel>>> getRegistration();
}
