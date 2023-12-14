// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchListAdapter extends TypeAdapter<WatchList> {
  @override
  final int typeId = 1;

  @override
  WatchList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchList(
      movies: (fields[2] as List).cast<MovieModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, WatchList obj) {
    writer
      ..writeByte(1)
      ..writeByte(2)
      ..write(obj.movies);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
