// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthenticatedUserModelAdapter
    extends TypeAdapter<AuthenticatedUserModel> {
  @override
  final int typeId = 0;

  @override
  AuthenticatedUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthenticatedUserModel(
      id: fields[0] as String,
      fish: fields[1] as String,
      address: fields[2] as String,
      imgurl: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthenticatedUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fish)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.imgurl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticatedUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
