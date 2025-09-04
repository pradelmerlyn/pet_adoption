import 'package:pet_adoption/models/animals/animals_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'animal_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class AnimalServices {
  factory AnimalServices({String? baseUrl}) {
    return _AnimalServices(DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.animals)
  Future<HttpResponse<List<AnimalModel>>> getAnimals();
}
