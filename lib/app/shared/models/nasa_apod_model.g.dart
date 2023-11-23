// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_apod_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NasaApodModelAdapter extends TypeAdapter<NasaApodModel> {
  @override
  final int typeId = 1;

  @override
  NasaApodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NasaApodModel(
      title: fields[0] as String?,
      date: fields[1] as String?,
      explanation: fields[2] as String?,
      imgUrl: fields[3] as String?,
      imgHdUrl: fields[4] as String?,
      mediaType: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NasaApodModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.explanation)
      ..writeByte(3)
      ..write(obj.imgUrl)
      ..writeByte(4)
      ..write(obj.imgHdUrl)
      ..writeByte(5)
      ..write(obj.mediaType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NasaApodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
