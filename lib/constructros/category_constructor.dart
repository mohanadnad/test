class CategoryConstructor {
  final String id;
  final String imageUrl;
  final String title;
  final String titleEn;

  const CategoryConstructor({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.titleEn,
  });
  factory CategoryConstructor.fromJson(Map<String, dynamic> json) {
    return CategoryConstructor(
      id: json["id"]?.toString() ?? "",
      imageUrl: json['imageUrl'] ?? "",
      title: json['title'] ?? "",
      titleEn: json['titleEn'] ?? "",
    );
  }
}
