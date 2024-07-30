class APIPath {
  static const base = "https://api.makar.my.id";

  static const admin = "$base/admin";
  static const adminLogin = "$admin/login";
  static const adminLogout = "$admin/logout";
  static const adminValidate = "$admin/validate";

  static const asset = "$base/asset";
  static String assetId(String id) => "$base/asset/$id";

  static const product = "$base/produk";
  static String productId(String id) => "$base/produk/$id";
}
