class CustomUser {
  final String uid;
  final String provider;
  final String? email;
  final String? displayName;
  final String? photoUrl;

  CustomUser({
    required this.uid,
    required this.provider,
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });
}
