import 'package:json_annotation/json_annotation.dart';

part 'commission.g.dart';

@JsonSerializable()
class Commission {
  int id;
  @JsonKey(name: 'employee_id')
  int employeeId;
  @JsonKey(name: 'order_id')
  int orderId;
  double commission;
  @JsonKey(name: 'settlement_status')
  String settlementStatus;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'settlement_date')
  String settlementDate;
  dynamic meta;

  Commission({
    required this.id,
    required this.commission,
    this.createdAt,
    required this.employeeId,
    this.meta,
    required this.orderId,
    required this.settlementDate,
    required this.settlementStatus,
    this.updatedAt,
  });

  factory Commission.fromJson(Map<String, dynamic> json) =>
      _$CommissionFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionToJson(this);
}
