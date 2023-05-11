// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderlist _$OrderlistFromJson(Map<String, dynamic> json) => Orderlist(
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderlistToJson(Orderlist instance) => <String, dynamic>{
      'orders': instance.orders,
    };
