class Product {
  String nama;
  String ingredient;
  String gambar;
  String is_bookmark;

  Product({
    required this.nama,
    required this.ingredient,
    required this.gambar,
    required this.is_bookmark,
  });

  factory Product.fromJson(Map json) {
    return Product(
      nama: json['nama'],
      ingredient: json['ingredient'],
      gambar: json['gambar'],
      is_bookmark: json['is_bookmark'] ?? 'false',
    );
  }

  toMap() {
    return {
      'nama': nama,
      'ingredient': ingredient,
      'gambar': gambar,
      'is_bookmark': is_bookmark,
    };
  }
}
