class Movie {
  int id;
  String title;
  String icon;
  List countries;
  List genres;
  dynamic year;
  dynamic rating;

  Movie({
    required this.icon,
    required this.year,
    required this.countries,
    required this.genres,
    required this.rating,
    required this.id,
    required this.title,
  });
}
