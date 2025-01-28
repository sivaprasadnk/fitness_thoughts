import 'package:fitness_thoughts/core/constants.dart';

class BlogModel {
  int? id;
  DateTime? date;
  String? dateString;
  String? title;
  String? subTitle;
  String? content;
  String? author;
  List<String>? tags;
  String? imageAssetPath;
  String? imageNetworkPath;
  bool? isActive;
  bool? isFeatured;
  String? cacheKey;
  BlogModel({
    this.id,
    this.content = '',
    this.date,
    this.dateString,
    this.title = '',
    this.subTitle = '',
    this.author = "",
    this.imageAssetPath = "",
    this.imageNetworkPath = "",
    this.isActive = true,
    this.isFeatured = false,
    this.tags = const [],
    this.cacheKey = "",
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    var id = json['id'] ?? 1;
    return BlogModel(
      id: id,
      title: json['title'] ?? '',
      subTitle: json['sub_title'] ?? "",
      content: json['content'] ?? "",
      date: json['date'],
      dateString: json['date_string'] ?? "",
      author: json['author'] ?? "",
      imageAssetPath: json['image_asset_path'] ?? "assets/images/image1.jpg",
      // imageAssetPath: 'assets/images/image$id.jpg',
      // imageNetworkPath: json['imagePath'] ?? "",
      imageNetworkPath: json['image_network_path'] ?? image,
      isActive: json['is_active'] ?? true,
      isFeatured: json['is_featured'] ?? false,
      tags: json['tags'] != null
          ? (json['tags'] as List).map((e) => e.toString()).toList()
          : [],
      cacheKey: json['cache_key'] ?? json['id'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'content': content,
      'dateString': dateString,
      'imageAssetPath': imageAssetPath,
      'imageNetworkPath': imageNetworkPath,
      'isActive': isActive,
      'isFeatured': isFeatured,
    };
  }
}
