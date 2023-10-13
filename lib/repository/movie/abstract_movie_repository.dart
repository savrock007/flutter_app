abstract class AbstractMovieRepository {
  Future getMoviesList();

  Future searchMovie(String title);

  Future getSavedMovies();
}
