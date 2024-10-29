import 'package:flutter/foundation.dart';
import 'package:techtarium/models/cart_item.dart';
import 'package:techtarium/models/order.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(
    List<CartItem> items,
    double total,
    ShippingAddress shippingAddress,
  ) {
    final now = DateTime.now();
    final deliveryDate = now.add(const Duration(days: 5));

    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: '1', // In a real app, this would come from auth
      items: items,
      total: total,
      orderDate: now,
      deliveryDate: deliveryDate,
      shippingAddress: shippingAddress,
    );

    _orders.insert(0, order);
    notifyListeners();
  }

  void cancelOrder(String orderId) {
    final orderIndex = _orders.indexWhere((order) => order.id == orderId);
    if (orderIndex >= 0) {
      _orders[orderIndex].status = OrderStatus.cancelled;
      notifyListeners();
    }
  }
}
