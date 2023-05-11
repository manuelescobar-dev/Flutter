import 'package:json_annotation/json_annotation.dart';
import 'package:template/order.dart';
part 'orderList.g.dart';

@JsonSerializable()
class Orderlist {
  List<Order>? orders;

  Orderlist({
    this.orders,
  });

  factory Orderlist.fromJson(Map<String, dynamic> json) =>
      _$OrderlistFromJson(json);
  Map<String, dynamic> toJson() => _$OrderlistToJson(this);
}
