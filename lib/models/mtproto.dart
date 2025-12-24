class MTProtoConfig {
  final String apiId;
  final String apiHash;
  final String server;
  final int port;

  const MTProtoConfig({
    required this.apiId,
    required this.apiHash,
    this.server = '149.154.167.50',
    this.port = 443,
  });
}

class AuthData {
  final String phoneNumber;
  final String phoneCodeHash;
  final String? password;

  const AuthData({
    required this.phoneNumber,
    required this.phoneCodeHash,
    this.password,
  });
}

class UploadProgress {
  final int uploaded;
  final int total;
  final double percentage;

  const UploadProgress({
    required this.uploaded,
    required this.total,
    required this.percentage,
  });
}