class UserModel {
  final String id;
  final String name;
  final String email;
  final String wallet;
  final String profile;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.wallet,
    required this.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      wallet: json['wallet'],
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'wallet': wallet,
      'profile': profile,
    };
  }
}
