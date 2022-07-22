// S3 Configuration
class S3Config {
  S3Config({
    required this.rootURL,
    required this.region,
    required this.environment,
    required this.bucket,
  });

  // rootURL
  // @description S3 Root URL
  final String rootURL;

  /// region
  /// @description S3 Regiion
  final String region;

  // environment
  // @description S3 Folder Environment
  final String environment;

  /// bucket
  /// @description S3 Bucket
  final String bucket;
}
