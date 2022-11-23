class ProductModel {
  final String name;
  final String price;
  final String description;

  ProductModel(
      {required this.name, required this.price, required this.description});

  // factory ProductModel.fromAdd(Map<String, dynamic> json) {
  //   return ProductModel(
  //       name: json['name'],
  //       price: json['price'],
  //       description: json['description']);
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['name'] = name;
  //   data['price'] = price;
  //   data['description'] = description;
  //   return data;
  // }
}
