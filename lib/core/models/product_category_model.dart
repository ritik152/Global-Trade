class ProductCategoryModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> features;

  const ProductCategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.features = const [],
  });
}
