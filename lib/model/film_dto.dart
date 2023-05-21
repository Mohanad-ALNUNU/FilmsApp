class FilmDTO {
  String id;
  String image;
  String duration;
  String date;
  String title;
  String category;
  double rate;

  FilmDTO({
    required this.id,
    required this.image,
    required this.duration,
    required this.date,
    required this.title,
    required this.category,
    required this.rate,
  });

  factory FilmDTO.fromJson(Map json) {
    return FilmDTO(
      id: json['id'],
      image: json['image'],
      duration: json['duration'],
      date: json['date'],
      category: json['category'],
      title: json['title'],
      rate: json['rate'],
    );
  }
}
