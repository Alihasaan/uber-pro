import 'car_model.dart';

class TripModel {
  final int id;
  final String unixId;

  final String uuid;
  final int? driverId;
  final int carId;
  final String startLocation;
  final String endLocation;
  final DateTime startTime;
  final DateTime? endTime;
  final String status;
  final String cost;
  final String brokerFee;
  final String currencyCode;
  final double? estimatedDistance;
  final String? estimatedTime;
  final DateTime? expectedStartTime;
  final DateTime? expectedEndTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double pickupLat;
  final double pickupLong;
  final double dropoffLat;
  final double dropoffLong;
  final bool deleted;
  final String cancelReason;
  final int? createdBy;
  final int pricingModelId;
  final bool allowBidding;
  final double? minBidPrice;
  final double? maxBidPrice;
  final CarModel car;
  final PricingModel pricingModel;

  TripModel({
    required this.id,
    required this.unixId,
    required this.uuid,
    this.driverId,
    required this.carId,
    required this.startLocation,
    required this.endLocation,
    required this.startTime,
    this.endTime,
    required this.status,
    required this.cost,
    required this.brokerFee,
    required this.currencyCode,
    this.estimatedDistance,
    this.estimatedTime,
    this.expectedStartTime,
    this.expectedEndTime,
    required this.createdAt,
    required this.updatedAt,
    required this.pickupLat,
    required this.pickupLong,
    required this.dropoffLat,
    required this.dropoffLong,
    required this.deleted,
    required this.cancelReason,
    this.createdBy,
    required this.pricingModelId,
    required this.allowBidding,
    this.minBidPrice,
    this.maxBidPrice,
    required this.car,
    required this.pricingModel,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      unixId: json['unixId'],
      uuid: json['uuid'],
      driverId: json['driverId'],
      carId: json['carId'],
      startLocation: json['startLocation'],
      endLocation: json['endLocation'],
      startTime: DateTime.parse(json['startTime']),
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      status: json['status'],
      cost: (num.parse(json['cost']) / 100).toString(),
      brokerFee: json['brokerFee'],
      currencyCode: json['currencyCode'],
      estimatedDistance: json['estimatedDistance']?.toDouble(),
      estimatedTime: json['estimatedTime'],
      expectedStartTime: json['expectedStartTime'] != null
          ? DateTime.parse(json['expectedStartTime'])
          : null,
      expectedEndTime: json['expectedEndTime'] != null
          ? DateTime.parse(json['expectedEndTime'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      pickupLat: json['pickupLat'].toDouble(),
      pickupLong: json['pickupLong'].toDouble(),
      dropoffLat: json['dropoffLat'].toDouble(),
      dropoffLong: json['dropoffLong'].toDouble(),
      deleted: json['deleted'],
      cancelReason: json['cancelReason'],
      createdBy: json['createdBy'],
      pricingModelId: json['pricingModelId'],
      allowBidding: json['allowBidding'],
      minBidPrice: json['minBidPrice']?.toDouble(),
      maxBidPrice: json['maxBidPrice']?.toDouble(),
      car: CarModel.fromJson(json['car']),
      pricingModel: PricingModel.fromJson(json['pricingModel']),
    );
  }
}

class PricingModel {
  final int id;
  final String model;
  final String description;
  final int appFeePercentage;
  final DateTime createdAt;
  final DateTime updatedAt;

  PricingModel({
    required this.id,
    required this.model,
    required this.description,
    required this.appFeePercentage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PricingModel.fromJson(Map<String, dynamic> json) {
    return PricingModel(
      id: json['id'],
      model: json['model'],
      description: json['description'],
      appFeePercentage: json['appFeePercentage'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
