// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commission _$CommissionFromJson(Map<String, dynamic> json) => Commission(
      id: json['id'] as int,
      commission: (json['commission'] as num).toDouble(),
      createdAt: json['created_at'] as String?,
      employeeId: json['employee_id'] as int,
      meta: json['meta'],
      orderId: json['order_id'] as int,
      settlementDate: json['settlement_date'] as String,
      settlementStatus: json['settlement_status'] as String,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CommissionToJson(Commission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee_id': instance.employeeId,
      'order_id': instance.orderId,
      'commission': instance.commission,
      'settlement_status': instance.settlementStatus,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'settlement_date': instance.settlementDate,
      'meta': instance.meta,
    };
