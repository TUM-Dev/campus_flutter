import 'package:hive/hive.dart';

class CacheResponse {
  DateTime saved;
  List<int> data;

  CacheResponse({required this.saved, required this.data});
}

class CacheResponseAdapter extends TypeAdapter<CacheResponse> {
  static const int _typeId = 111;

  @override
  int get typeId => _typeId;

  @override
  void write(BinaryWriter writer, CacheResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.saved)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  CacheResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheResponse(
        saved: fields[0] as DateTime, data: (fields[1] as List).cast<int>());
  }
}
