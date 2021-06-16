class ProductModel {
  final int objectId;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  final String reference;
  final int stock;

  const ProductModel({required this.objectId, required this.title, required this.imageUrl,
                      required this.price, required this.description,
                      required this.reference, required this.stock});
}