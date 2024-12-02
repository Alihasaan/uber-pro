class CarModel {
  final int id;
  final int carBrandId;
  final int carModelId;
  final int carCategoryId;
  final int carFuelTypeId;
  final String registrationNumber;
  final int year;
  final int companyId;
  final String rentalType;
  final String description;
  final String mileage;
  final int colorId;
  final String status;
  final int capacity;
  final String transmission;
  final int rating;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  CarModel({
    required this.id,
    required this.carBrandId,
    required this.carModelId,
    required this.carCategoryId,
    required this.carFuelTypeId,
    required this.registrationNumber,
    required this.year,
    required this.companyId,
    required this.rentalType,
    required this.description,
    required this.mileage,
    required this.colorId,
    required this.status,
    required this.capacity,
    required this.transmission,
    required this.rating,
    required this.deleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      carBrandId: json['carBrandId'],
      carModelId: json['carModelId'],
      carCategoryId: json['carCategoryId'],
      carFuelTypeId: json['carFuelTypeId'],
      registrationNumber: json['registrationNumber'],
      year: json['year'],
      companyId: json['companyId'],
      rentalType: json['rentalType'],
      description: json['description'],
      mileage: json['mileage'] ?? "",
      colorId: json['colorId'],
      status: json['status'],
      capacity: json['capacity'],
      transmission: json['transmission'],
      rating: json['rating'],
      deleted: json['deleted'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
