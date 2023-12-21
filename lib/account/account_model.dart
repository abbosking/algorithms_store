class Account {
  final int id;
  final String username;
  final String email;
  final String bio;
  final String status;
  final String profileImage;

  Account({
    required this.id,
    required this.username,
    required this.email,
    required this.bio,
    required this.status,
    required this.profileImage,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      bio: json['bio'],
      status: json['status'],
      profileImage: json['profileImage'],
    );
  }
}
