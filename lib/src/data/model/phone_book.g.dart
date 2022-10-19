// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneBookAdapter extends TypeAdapter<PhoneBook> {
  @override
  final int typeId = 0;

  @override
  PhoneBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhoneBook(
      id: fields[0] as String,
      idList: fields[1] as String,
      idItem: fields[2] as String,
      idCat: fields[3] as String,
      noibat: fields[4] as String,
      photo: fields[5] as String,
      thumb: fields[6] as String,
      ten: fields[7] as String,
      title: fields[8] as String,
      keywords: fields[9] as String,
      description: fields[10] as String,
      tenkhongdau: fields[11] as String,
      gia: fields[12] as String,
      dientich: fields[13] as String,
      mota: fields[14] as String,
      noidung: fields[15] as String,
      stt: fields[16] as String,
      hienthi: fields[17] as String,
      ngaytao: fields[19] as String,
      ngaysua: fields[20] as String,
      luotxem: fields[21] as String,
      mabn: fields[22] as String,
      diachi: fields[23] as String,
      dienthoai: fields[24] as String,
      ngaysinh: fields[25] as String,
      gioitinh: fields[26] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhoneBook obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idList)
      ..writeByte(2)
      ..write(obj.idItem)
      ..writeByte(3)
      ..write(obj.idCat)
      ..writeByte(4)
      ..write(obj.noibat)
      ..writeByte(5)
      ..write(obj.photo)
      ..writeByte(6)
      ..write(obj.thumb)
      ..writeByte(7)
      ..write(obj.ten)
      ..writeByte(8)
      ..write(obj.title)
      ..writeByte(9)
      ..write(obj.keywords)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.tenkhongdau)
      ..writeByte(12)
      ..write(obj.gia)
      ..writeByte(13)
      ..write(obj.dientich)
      ..writeByte(14)
      ..write(obj.mota)
      ..writeByte(15)
      ..write(obj.noidung)
      ..writeByte(16)
      ..write(obj.stt)
      ..writeByte(17)
      ..write(obj.hienthi)
      ..writeByte(19)
      ..write(obj.ngaytao)
      ..writeByte(20)
      ..write(obj.ngaysua)
      ..writeByte(21)
      ..write(obj.luotxem)
      ..writeByte(22)
      ..write(obj.mabn)
      ..writeByte(23)
      ..write(obj.diachi)
      ..writeByte(24)
      ..write(obj.dienthoai)
      ..writeByte(25)
      ..write(obj.ngaysinh)
      ..writeByte(26)
      ..write(obj.gioitinh);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
