class UserDetails {
  final String uid;
  final String email;
  final String name;

  UserDetails({
    required this.uid,
    required this.email,
    required this.name,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}