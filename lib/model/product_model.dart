class Product {
  final int? id;
  final String name;
  final double price;
  final String? description;
  final String? qrCode;
  final String unit;

  Product(
      {this.id,
      required this.name,
      required this.price,
      this.description,
      this.qrCode,
      required this.unit});

  Product.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        price = res["price"],
        description = res["description"],
        qrCode = res["qrCode"],
        unit = res["unit"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'qrCode': qrCode,
      'unit': unit
    };
  }
}
