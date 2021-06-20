abstract class ProductRepository {
  getAllProducts();

  getProductByIndex(int index);

  getProductsWithReferences(List<String> references);
}
