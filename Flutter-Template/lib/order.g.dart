// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      uid: json['uid'] as String,
      productID: json['productID'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'uid': instance.uid,
      'productID': instance.productID,
      'date': instance.date,
    };
