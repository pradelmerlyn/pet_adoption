import 'package:pet_adoption/models/agreement/agreement_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'agreement_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class AgreementServices {
  factory AgreementServices({String? baseUrl}) {
    return _AgreementServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.agreement)
  Future<HttpResponse<List<AgreementModel>>> getAgreement();
}
