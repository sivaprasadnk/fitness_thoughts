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
  String? isActive;
  String? isFeatured;
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
    this.isActive = 'Y',
    this.isFeatured = 'Y',
    this.tags = const [],
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    var id = json['id'] ?? 1;
    return BlogModel(
      id: id,
      title: json['title'] ?? '',
      subTitle: json['subTitle'] ?? "",
      content: json['content'] ?? "",
      date: json['date'],
      dateString: json['dateString'] ?? "",
      author: json['author'] ?? "",
      imageAssetPath: json['imageAssetPath'] ?? "assets/images/image1.jpg",
      // imageAssetPath: 'assets/images/image$id.jpg',
      // imageNetworkPath: json['imagePath'] ?? "",
      imageNetworkPath: json['imageNetworkPath'] ?? image,
      isActive: json['isActive'] ?? "Y",
      isFeatured: json['isFeatured'] ?? "Y",
      tags: json['tags'] != null
          ? (json['tags'] as List).map((e) => e.toString()).toList()
          : [],
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
