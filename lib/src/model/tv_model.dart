class Tv {
  String? backdrop_path;
  String? first_air_date;
  int? id;
  String? name;
  List<dynamic>? origin_country;
  String? original_language;
  String? original_name;
  String? overview;
  double? popularity;
  String? poster_path;
  num? vote_average;
  int? vote_count;
  bool? isClick;

  Tv(
      {this.backdrop_path,
      this.first_air_date,
      this.id,
      this.name,
      this.origin_country,
      this.original_language,
      this.original_name,
      this.overview,
      this.popularity,
      this.poster_path,
      this.vote_average,
      this.vote_count,
      this.isClick});

  Tv.fromJson(Map<String, dynamic>json)
      : backdrop_path = json['backdrop_path']== null ? '' : json['backdrop_path'] as String,
        first_air_date = json['first_air_date'] as String,
        id = json['id'] as int,
        name = json['name'] as String,
        origin_country = json['origin_country'] as List,
        original_language = json['original_language'] as String,
        original_name = json['original_name'] as String,
        overview = json['overview'] as String,
        popularity = json['popularity'] as double,
        poster_path = json['poster_path'] == null ? '/yoRTuyC2cYLXJzKct9Iql0gcCL1.jpg' : json['poster_path'] as String,
        vote_average = json['vote_average'] as num,
        vote_count = json['vote_count'] as int,
        isClick = true;

  String get posterUrl => 'https://image.tmdb.org/t/p/w500/$poster_path';
}
