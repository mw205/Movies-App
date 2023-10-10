import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movies/model/movies_model.dart';
import 'package:movies/model/movies_service.dart';

class MoviesSearchController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  Rx<MoviesData?> moviesData = Rx<MoviesData?>(null);
  RxInt count = 0.obs;
  @override
  void onInit() async {
    textEditingController.addListener(_performSearch);
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.removeListener(_performSearch);

    textEditingController.dispose();
    super.onClose();
  }

  void _performSearch() async {
    moviesData.value =
        await MoviesService.searchByName(textEditingController.text);
    count.value = moviesData.value?.moviesList?.length ?? 0;
  }

  String? getMovieName(int index) {
    try {
      return moviesData.value!.moviesList?[index]['original_title'];
    } catch (e) {
      return null;
    }
  }

  String? getMovieDate(int index) {
    try {
      return moviesData.value!.moviesList![index]['release_date']
          .toString()
          .split("-")[0];
    } catch (e) {
      return null;
    }
  }

  String? getPosterUrl(int index) {
    final movieList = moviesData.value?.moviesList;
    if (movieList != null && index < movieList.length) {
      final posterPath = movieList[index]['poster_path'];
      if (posterPath != null) {
        return "https://image.tmdb.org/t/p/w500/$posterPath";
      }
    }
    return "";
  }

  String getMovieOverview(int index) {
    return moviesData.value!.moviesList![index]['overview'];
  }

  String? getMoviePopularity(
    int index,
  ) {
    return moviesData.value!.moviesList?[index]['popularity'].toString();
  }

  String getBackdropImageUrl(
    int index,
  ) {
    final movieList = moviesData.value?.moviesList;
    if (movieList != null && index < movieList.length) {
      final posterPath = movieList[index]['backdrop_path'];
      if (posterPath != null) {
        return "https://image.tmdb.org/t/p/w500/$posterPath";
      }
    }
    return "";
  }

  String? getMovieAverageRating(int index) {
    try {
      return moviesData.value!.moviesList?[index]['vote_average'].toString();
    } catch (e) {
      return null;
    }
  }
}
