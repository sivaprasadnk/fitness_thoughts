class SystemConfig {
  int? id;
  int? buildNumber;
  int? versionNumber;
  bool? isLatest;
  bool? showBiometrics;

  SystemConfig({
    required this.buildNumber,
    required this.id,
    required this.isLatest,
    required this.versionNumber,
    this.showBiometrics,
  });

  factory SystemConfig.fromJson(Map<String, dynamic> json) {
    return SystemConfig(
      buildNumber: json['build_number'],
      id: json['id'],
      isLatest: json['is_latest'],
      versionNumber: json['version_number'],
      showBiometrics: json['show_biometrics'] ?? false,
    );
  }
}
