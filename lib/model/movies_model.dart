class MoviesData {
  List<dynamic>? moviesList;

  MoviesData({this.moviesList});
  factory MoviesData.fromjson(jsonData) {
    List<dynamic> movies = jsonData['results'];
    return MoviesData(moviesList: movies);
  }
}
