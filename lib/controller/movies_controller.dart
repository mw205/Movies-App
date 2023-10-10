import 'package:get/get.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/model/movies_service.dart';

enum MoviesListType { upcoming, topRated, popular, search }

class MoviesController extends GetxController {
  List<dynamic>? moviesData;

  @override
  void onInit() async {
    super.onInit();
    moviesData = await MoviesService().getMoviesLists();
  }

  MoviesData get topRatedMovies => moviesData?[0] ?? MoviesData();
  MoviesData get popularMovies => moviesData?[1] ?? MoviesData();
  MoviesData get upcomingMovies => moviesData?[2] ?? MoviesData();

  String getPosterUrl(int index, MoviesListType type) {
    String? posterPath;
    if (type == MoviesListType.popular) {
      posterPath =
          "https://image.tmdb.org/t/p/w500/${popularMovies.moviesList?[index]['poster_path']}";
    } else if (type == MoviesListType.topRated) {
      posterPath =
          "https://image.tmdb.org/t/p/w500/${topRatedMovies.moviesList?[index]['poster_path']}";
    } else {
      posterPath =
          "https://image.tmdb.org/t/p/w500/${upcomingMovies.moviesList?[index]['poster_path']}";
    }
    if (popularMovies.moviesList == null ||
        topRatedMovies.moviesList == null ||
        upcomingMovies.moviesList == null) {
      return "";
    } else {
      return posterPath;
    }
  }

  String getBackdropImageUrl(int index, MoviesListType type) {
    if (type == MoviesListType.popular) {
      return "https://image.tmdb.org/t/p/w500/${popularMovies.moviesList?[index]['backdrop_path']}";
    } else if (type == MoviesListType.topRated) {
      return "https://image.tmdb.org/t/p/w500/${topRatedMovies.moviesList?[index]['backdrop_path']}";
    } else {
      return "https://image.tmdb.org/t/p/w500/${upcomingMovies.moviesList?[index]['backdrop_path']}";
    }
  }

  String? getMovieAverageRating(int index, MoviesListType type) {
    if (type == MoviesListType.popular) {
      return popularMovies.moviesList?[index]['vote_average'].toString();
    } else if (type == MoviesListType.topRated) {
      return topRatedMovies.moviesList?[index]['vote_average'].toString();
    } else {
      return upcomingMovies.moviesList?[index]['vote_average'].toString();
    }
  }

  String? getMoviePopularity(int index, MoviesListType type) {
    if (type == MoviesListType.popular) {
      return popularMovies.moviesList?[index]['popularity'].toString();
    } else if (type == MoviesListType.topRated) {
      return topRatedMovies.moviesList?[index]['popularity'].toString();
    } else {
      return upcomingMovies.moviesList?[index]['popularity'].toString();
    }
  }

  String? getMovieName(int index, MoviesListType type) {
    try {
      if (type == MoviesListType.popular) {
        return popularMovies.moviesList?[index]['original_title'];
      } else if (type == MoviesListType.topRated) {
        return topRatedMovies.moviesList?[index]['original_title'];
      } 
      else {
        return upcomingMovies.moviesList?[index]['original_title'];
      }
    } catch (e) {
      return "";
    }
  }

  String getMovieDate(int index, MoviesListType type) {
    if (type == MoviesListType.popular) {
      return popularMovies.moviesList![index]['release_date']
          .toString()
          .split("-")[0];
    } else if (type == MoviesListType.topRated) {
      return topRatedMovies.moviesList![index]['release_date']
          .toString()
          .split("-")[0];
    } else {
      return upcomingMovies.moviesList![index]['release_date']
          .toString()
          .split("-")[0];
    }
  }

  String getMovieOverview(int index, MoviesListType type) {
    if (type == MoviesListType.popular) {
      return popularMovies.moviesList![index]['overview'];
    } else if (type == MoviesListType.topRated) {
      return topRatedMovies.moviesList![index]['overview'];
    } else {
      return upcomingMovies.moviesList![index]['overview'];
    }
  }
}
