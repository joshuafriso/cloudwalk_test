class NasaApodModel {
  String? title;
  String? date;
  String? explanation;
  String? imgUrl;
  String? imgHdUrl;
  String? mediaType;

  NasaApodModel(
      {this.title,
      this.date,
      this.explanation,
      this.imgUrl,
      this.imgHdUrl,
      this.mediaType});

  factory NasaApodModel.fromJson(Map<dynamic, dynamic> json) => NasaApodModel(
        date: json["date"],
        explanation: json["explanation"],
        imgHdUrl: json["hdurl"],
        title: json["title"],
        imgUrl: json["url"],
        mediaType: json["media_type"],
      );

  static List<NasaApodModel>? fromJsonList(List? list) {
    if (list == null) return null;
    return list
        .map<NasaApodModel>((item) => NasaApodModel.fromJson(item))
        .toList();
  }
}
