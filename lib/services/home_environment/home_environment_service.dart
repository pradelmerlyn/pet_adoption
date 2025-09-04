
import 'package:pet_adoption/models/home_environment/home_environment_model.dart';
import 'package:pet_adoption/utils/dio_instance.dart';
import 'package:pet_adoption/utils/endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'home_environment_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class HomeEnvironmentServices {
  factory HomeEnvironmentServices({String? baseUrl}) {
    return _HomeEnvironmentServices (DioInstance.init(),
        baseUrl: baseUrl ?? Endpoints.baseUrl);
  }

  @GET(Endpoints.homeEnvironment)
  Future<HttpResponse<List<HomeEnvironmentModel>>> getHomeEnvironment();
}
