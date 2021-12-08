class Person {
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  String? title;
  num? vote_average;
  int? vote_count;
  bool? adult;
  int? id;

  Person({
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.release_date,
    this.title,
    this.vote_average,
    this.vote_count,
    this.adult,
    this.id
  });

  Person.fromJson(Map<String, dynamic>json) : 
    original_title = json['original_title'] as String,
    overview = json['overview'] as String,
    popularity = json['popularity'] as double,
    poster_path = json['poster_path'] as String,
    release_date = json['release_date']== null ? '' : json['release_date'] as String,
    title = json['title'] as String,
    vote_average = json['vote_average'] as num,
    vote_count = json['vote_count'] as int,
    adult = json['adult'] as bool,
    id = json['id'] as int;

  String get posterUrl => 'https://image.tmdb.org/t/p/w500/$poster_path';
}