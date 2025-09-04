import 'package:pet_adoption/models/agreement/agreement_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'pet_reference_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class PetReferenceServices {
  factory PetReferenceServices({String? baseUrl}) {
    return _PetReferenceServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.petReference)
  Future<HttpResponse<List<AgreementModel>>> getPetReference();
}
