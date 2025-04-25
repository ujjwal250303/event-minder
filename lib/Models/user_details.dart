class UserDetails {
  final String uid;
  final String email;
  final String name;
  final String role;

  UserDetails({required this.uid, required this.email, required this.name, required this.role});

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'name': name,
    'role': role,
  };

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      role: json['role'],
    );
  }
}