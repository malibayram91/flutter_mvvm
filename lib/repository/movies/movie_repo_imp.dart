import 'package:flutter/foundation.dart';
import 'package:project/data/remote/network/api_end_points.dart';
import 'package:project/data/remote/network/base_api_service.dart';
import 'package:project/data/remote/network/network_api_service.dart';
import 'package:project/models/moviesList/movies_main.dart';
import 'package:project/repository/movies/movie_repo.dart';

class MovieRepoImp implements MovieRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<MoviesMain?> getMoviesList() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getMovies);
      debugPrint("MARAJ $response");
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      debugPrint("MARAJ-E $e}");
      rethrow;
    }
  }
}
