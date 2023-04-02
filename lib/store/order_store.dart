import 'dart:developer';

import 'package:dropr_driver/models/commission.dart';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = _OrderStore with _$OrderStore;

abstract class _OrderStore with Store {
  @observable
  bool _isLoading = false;

  bool get loadingState {
    return _isLoading;
  }

  @observable
  Map<int, Order> _orders = <int, Order>{};

  @observable
  Map<int, Commission> commissions = <int, Commission>{};

  @observable
  bool _fetchedOrdersOnce = false;

  @observable
  bool fetchedCommissionOnce = false;

  bool get fetchedOrdersOnce {
    return _fetchedOrdersOnce;
  }

  @computed
  List<Order> get orders {
    return _orders.values.toList();
  }

  Order? orderById(int? id) {
    if(id == null){
      return null;
    }
    if (_orders.containsKey(id)) {
      return _orders[id];
    }
    return null;
  }

  @action
  Future<void> fetchOrders() async {
    try {
      _isLoading = true;
      _orders = await orderService.getAllOrders();
      _fetchedOrdersOnce = true;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      log('Error in store $e');
    }
  }

  @action
  Future<void> addOrder(Map<String, dynamic> body) async {
    try {
      _isLoading = true;
      Order order = await orderService.addOrder(body);
      _orders.addAll({
        order.id: order,
      });
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  @action
  Future<void> deleteOrder(int id) async {
    try {
      _isLoading = true;
      bool isDeleted = await orderService.deleteOrder(id);
      if (isDeleted && _orders.containsKey(id)) {
        _orders.remove(id);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  @action
  fetchCommissions() async {
    try {
      _isLoading = true;
      commissions = await orderService.getCommissions();
      fetchedCommissionOnce = true;
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  @action
  void reset() {
    _isLoading = true;
    _fetchedOrdersOnce = false;
    _orders.clear();
    commissions.clear();
    _isLoading = false;
  }
}
