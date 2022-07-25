
class Product {
  Product({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rating
  });

  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;
  final Rating? rating;



  factory Product.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Product();
    return Product(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      category: json["category"],
      description: json["description"],
      image: json["image"],
      rating : Rating.fromJson(json["rating"])
    );
  }
}

class Rating {
  final double? rate;
  final int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );
}
