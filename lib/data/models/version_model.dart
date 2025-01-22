class VersionModel {
  int? id;
  int? buildNumber;
  int? versionNumber;
  bool? isLatest;

  VersionModel({
    required this.buildNumber,
    required this.id,
    required this.isLatest,
    required this.versionNumber,
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      buildNumber: json['build_number'],
      id: json['id'],
      isLatest: json['is_latest'],
      versionNumber: json['version_number'],
    );
  }
}
