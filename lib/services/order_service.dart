import 'dart:developer';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/services/api_service.dart';


class OrderService extends APIService {
  OrderService._();

  factory OrderService.getInstance() => _instance;
  static final OrderService _instance = OrderService._();

  Future<Map<int, Order>> getAllOrders() async {
    Map<String, dynamic> response = await get(
      '/orders',
      useAuthHeaders: true,
    );
    Map<int, Order> _orders = <int, Order>{};
    response['data'].forEach((element) {
      Order order = Order.fromJson(element);
      _orders.addAll({order.id: order});
    });
    log('here response is this get all orders' + _orders.length.toString());
    return _orders;
  }

  Future<void> getOrderById(int id) async {
    Map<String, dynamic> response = await get(
      '/orders/$id',
      useAuthHeaders: true,
    );

    log('here response is this' + response.toString());
  }

  Future<Order> addOrder(Map<String, dynamic> body) async {
    Map<String, dynamic> response = await post(
      '/orders',
      body: body,
    );

    log('here response is this posting ' + response.toString());
    return Order.fromJson(response['data']);
  }

  Future<bool> deleteOrder(int id) async {
    Map<String, dynamic> response = await delete(
      '/orders/$id',
    );

    log('here response is this' + response.toString());
    return false;
  }
}
