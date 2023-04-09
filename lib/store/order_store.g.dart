// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderStore on _OrderStore, Store {
  Computed<List<Order>>? _$ordersComputed;

  @override
  List<Order> get orders => (_$ordersComputed ??=
          Computed<List<Order>>(() => super.orders, name: '_OrderStore.orders'))
      .value;

  late final _$_isLoadingAtom =
      Atom(name: '_OrderStore._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_ordersAtom =
      Atom(name: '_OrderStore._orders', context: context);

  @override
  Map<int, Order> get _orders {
    _$_ordersAtom.reportRead();
    return super._orders;
  }

  @override
  set _orders(Map<int, Order> value) {
    _$_ordersAtom.reportWrite(value, super._orders, () {
      super._orders = value;
    });
  }

  late final _$commissionsAtom =
      Atom(name: '_OrderStore.commissions', context: context);

  @override
  Map<int, Commission> get commissions {
    _$commissionsAtom.reportRead();
    return super.commissions;
  }

  @override
  set commissions(Map<int, Commission> value) {
    _$commissionsAtom.reportWrite(value, super.commissions, () {
      super.commissions = value;
    });
  }

  late final _$_fetchedOrdersOnceAtom =
      Atom(name: '_OrderStore._fetchedOrdersOnce', context: context);

  @override
  bool get _fetchedOrdersOnce {
    _$_fetchedOrdersOnceAtom.reportRead();
    return super._fetchedOrdersOnce;
  }

  @override
  set _fetchedOrdersOnce(bool value) {
    _$_fetchedOrdersOnceAtom.reportWrite(value, super._fetchedOrdersOnce, () {
      super._fetchedOrdersOnce = value;
    });
  }

  late final _$fetchedCommissionOnceAtom =
      Atom(name: '_OrderStore.fetchedCommissionOnce', context: context);

  @override
  bool get fetchedCommissionOnce {
    _$fetchedCommissionOnceAtom.reportRead();
    return super.fetchedCommissionOnce;
  }

  @override
  set fetchedCommissionOnce(bool value) {
    _$fetchedCommissionOnceAtom.reportWrite(value, super.fetchedCommissionOnce,
        () {
      super.fetchedCommissionOnce = value;
    });
  }

  late final _$fetchOrdersAsyncAction =
      AsyncAction('_OrderStore.fetchOrders', context: context);

  @override
  Future<void> fetchOrders() {
    return _$fetchOrdersAsyncAction.run(() => super.fetchOrders());
  }

  late final _$addOrderAsyncAction =
      AsyncAction('_OrderStore.addOrder', context: context);

  @override
  Future<void> addOrder(Map<String, dynamic> body) {
    return _$addOrderAsyncAction.run(() => super.addOrder(body));
  }

  late final _$deleteOrderAsyncAction =
      AsyncAction('_OrderStore.deleteOrder', context: context);

  @override
  Future<void> deleteOrder(int id) {
    return _$deleteOrderAsyncAction.run(() => super.deleteOrder(id));
  }

  late final _$fetchCommissionsAsyncAction =
      AsyncAction('_OrderStore.fetchCommissions', context: context);

  @override
  Future fetchCommissions() {
    return _$fetchCommissionsAsyncAction.run(() => super.fetchCommissions());
  }

  late final _$_OrderStoreActionController =
      ActionController(name: '_OrderStore', context: context);

  @override
  void reset() {
    final _$actionInfo =
        _$_OrderStoreActionController.startAction(name: '_OrderStore.reset');
    try {
      return super.reset();
    } finally {
      _$_OrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
commissions: ${commissions},
fetchedCommissionOnce: ${fetchedCommissionOnce},
orders: ${orders}
    ''';
  }
}
