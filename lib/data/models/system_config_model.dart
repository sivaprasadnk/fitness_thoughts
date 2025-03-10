class SystemConfig {
  int? id;
  int? buildNumber;
  int? versionNumber;
  bool? isLatest;
  bool? showBiometrics;
  String? appName;
  String? testKey;
  String? liveKey;
  String? appDescription;

  SystemConfig({
    required this.buildNumber,
    required this.id,
    required this.isLatest,
    required this.versionNumber,
    this.showBiometrics,
    this.appName,
    this.liveKey,
    this.testKey,
    this.appDescription,
  });

  factory SystemConfig.fromJson(Map<String, dynamic> json) {
    return SystemConfig(
      buildNumber: json['build_number'],
      id: json['id'],
      isLatest: json['is_latest'],
      versionNumber: json['version_number'],
      showBiometrics: json['show_biometrics'] ?? false,
      appName: json['app_name'] ?? "",
      appDescription: json['description'] ?? "",
      testKey: json['test_key'] ?? "",
      liveKey: json['live_key'] ?? "",
    );
  }
}
