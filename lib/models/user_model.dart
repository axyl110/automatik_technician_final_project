class UserModel {
  String fullName;
  String email;
  String phoneNumber;
  String password;
  String profilePictureUrl;
  double latitude;
  double longitude;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.profilePictureUrl,
    this.latitude = 0.0,
    this.longitude = 0.0,
  });
   // Define a toMap method to convert UserModel to a map
  Map<String, dynamic> toMap() {
    return {
      'firstName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'profilePictureUrl': profilePictureUrl,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
