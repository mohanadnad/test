class UserConstructor {
  final String id;
  final String userId;
  final String name;
  final String email;

  final String createdAt;
  final int bookingsCount;

  UserConstructor({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,

    required this.createdAt,
    required this.bookingsCount,
  });

  factory UserConstructor.fromJson(Map<String, dynamic> json) {
    return UserConstructor(
      id: json["id"].toString(),
      userId: json["user_id"],
      name: json["name"] ?? "",
      email: json["email"] ?? "",

      createdAt: json["created_at"] ?? '',
      bookingsCount: int.parse(json["bookings_count"].toString()),
    );
  }
}
