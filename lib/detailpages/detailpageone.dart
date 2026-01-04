class Products {
  final String name;
  final String features;
  final String description;
  final List<String> images;
  final double rating;
  final String boughtCount;

  final int price;
  final int discountPrice;
  final String offer;

  Products({
    required this.name,
  required this.features,
    required this.description,
    required this.images,
    required this.rating,
    required this.boughtCount,

    required this.price,
    required this.discountPrice,
    required this.offer,
  });
}
