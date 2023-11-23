import 'package:hive/hive.dart';

part "nasa_apod_model.g.dart";

@HiveType(typeId: 1)
class NasaApodModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? date;
  @HiveField(2)
  String? explanation;
  @HiveField(3)
  String? imgUrl;
  @HiveField(4)
  String? imgHdUrl;
  @HiveField(5)
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
