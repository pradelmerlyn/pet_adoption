
import 'package:pet_adoption/models/pet_care/pet_care_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'pet_care_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class PetCareServices {
  factory PetCareServices({String? baseUrl}) {
    return _PetCareServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.petCare)
  Future<HttpResponse<List<PetCareModel>>> getPetCareInfo();
}
