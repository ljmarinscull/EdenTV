// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 0;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      id: fields[1] as String,
      title: fields[2] as String,
      year: fields[3] as String,
      genres: (fields[4] as List).cast<String>(),
      ratings: (fields[5] as List).cast<int>(),
      duration: fields[6] as String,
      releaseDate: fields[7] as String,
      storyline: fields[8] as String,
      actors: (fields[9] as List).cast<String>(),
      posterUrl: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.ratings)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.storyline)
      ..writeByte(9)
      ..write(obj.actors)
      ..writeByte(10)
      ..write(obj.posterUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
