// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_view_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardViewModelAdapter extends TypeAdapter<CardViewModel> {
  @override
  final int typeId = 0;

  @override
  CardViewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardViewModel(
      title: fields[0] as String,
      imageUrl: fields[1] as String,
      detailsID: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CardViewModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.detailsID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardViewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
