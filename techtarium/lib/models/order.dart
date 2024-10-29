import 'package:techtarium/models/cart_item.dart';

enum OrderStatus { pending, delivered, cancelled }

class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double total;
  OrderStatus status;
  final DateTime orderDate;
  final DateTime deliveryDate;
  final ShippingAddress shippingAddress;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    this.status = OrderStatus.pending,
    required this.orderDate,
    required this.deliveryDate,
    required this.shippingAddress,
  });
}

class ShippingAddress {
  final String name;
  final String address;
  final String city;
  final String zipCode;

  ShippingAddress({
    required this.name,
    required this.address,
    required this.city,
    required this.zipCode,
  });
}
