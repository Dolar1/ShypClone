class Order {
  int orderId;
  String from;
  String to;
  String status;
  int quantityInTon;
  String pickupDate;
  String materialType;
  String vehicleType;
  int pricePerTon;

  Order({
    required this.orderId,
    required this.from,
    required this.to,
    required this.status,
    required this.quantityInTon,
    required this.pickupDate,
    required this.materialType,
    required this.vehicleType,
    required this.pricePerTon,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'] as int,
      from: json['from'] as String,
      to: json['to'] as String,
      status: json['status'] as String,
      quantityInTon: json['quantityInTon'] as int,
      pickupDate: json['pickupDate'] as String,
      materialType: json['materialType'] as String,
      vehicleType: json['vehicleType'] as String,
      pricePerTon: json['pricePerTon'] as int,
    );
  }
}
