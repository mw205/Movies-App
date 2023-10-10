import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/model/movies_model.dart';

class MoviesService {
  static const String baseApi = "https://api.themoviedb.org/3/movie/";
  static const String _accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNGU2NDlmNGNjYzA1OWVhZThmMjdlZTIxYTdiYjM5MSIsInN1YiI6IjY1MWQ4ZjEyYzUwYWQyMDEyYzFiNGI4ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9WAI6Sl5s5_Hcpxsd3LXiGVWD9Uln5tKyS0tDNL_cPU";
  static String get accessToken {
    return _accessToken;
  }

  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization': "Bearer $accessToken"
  };

  Future<List<MoviesData>?> getMoviesLists() async {
    searchByName("dark");
    List<Future<http.Response>> futures = [];
    futures.add(http.get(Uri.parse("${baseApi}top_rated?language=en-US&page=1"),
        headers: headers));
    futures.add(http.get(Uri.parse("${baseApi}popular?language=en-US&page=1"),
        headers: headers));
    futures.add(http.get(Uri.parse("${baseApi}upcoming?language=en-US&page=1"),
        headers: headers));

    List<http.Response> responses = await Future.wait(futures);
    List<MoviesData> responseData = [];
    bool shouldRetry = false;

    do {
      shouldRetry = false;

      for (int i = 0; i < responses.length; i++) {
        if (responses[i].statusCode == 200) {
          Map<String, dynamic>? data = jsonDecode(responses[i].body);

          if (data == null) {
            shouldRetry = true;
            break; // Break out of the loop and retry
          }

          responseData.add(MoviesData.fromjson(data));
        } else {
          shouldRetry = true;
        }
      }

      if (shouldRetry) {
        // Retry after a delay
        await Future.delayed(const Duration(seconds: 1));

        // Make the requests again
        responses = await Future.wait(futures);
      }
    } while (shouldRetry);

    return responseData;
  }

  static Future<MoviesData?> searchByName(String query) async {
    Uri searchUrl = Uri.parse("https://api.themoviedb.org/3/search/movie");
    var queryParams = {
      'query': query,
    };
    var url = Uri.https(searchUrl.authority, searchUrl.path, queryParams);
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic>? data = jsonDecode(response.body);
      MoviesData moviesData = MoviesData.fromjson(data);
      return moviesData;
    } else {
      return null;
    }
  }
}
