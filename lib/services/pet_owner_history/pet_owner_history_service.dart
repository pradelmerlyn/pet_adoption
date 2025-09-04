
import 'package:pet_adoption/models/pet_owner_history/pet_owner_history_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'pet_owner_history_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class PetOwnerHistoryServices {
  factory PetOwnerHistoryServices({String? baseUrl}) {
    return _PetOwnerHistoryServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.petOwnership)
  Future<HttpResponse<List<PetOwnerHistoryModel>>> getPetOwnerHistory();
}
