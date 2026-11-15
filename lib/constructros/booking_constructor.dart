class BookingConstructor {
  final String id;
  final String userId;
  final String userName;
  final String phone;
  final String tripId;
  final String email;
  // final String hotelId;
  final int adults;
  final int children;
  final int infants;
  final double totalPrice;
  final String tripTime;
  final String createdAt;

  BookingConstructor({
    required this.id,
    required this.userId,
    required this.userName,
    required this.phone,
    required this.tripId,
    // required this.hotelId,
    required this.adults,
    required this.children,
    required this.infants,
    required this.totalPrice,
    required this.tripTime,
    required this.createdAt,
    required this.email,
  });

  factory BookingConstructor.fromJson(Map<String, dynamic> json) {
    return BookingConstructor(
      email: json['email'] ?? '',
      id: json["id"].toString(),
      userId: json["user_id"] ?? "",
      userName: json["user_name"] ?? "",
      phone: json["phone"] ?? "",
      tripId: json["trip_id"] ?? "",
      // hotelId: json["hotel_id"] ?? "",
      adults: int.tryParse(json["adults"].toString()) ?? 0,
      children: int.tryParse(json["children"].toString()) ?? 0,
      infants: int.tryParse(json["infants"].toString()) ?? 0,
      totalPrice: double.tryParse(json["total_price"].toString()) ?? 0,
      tripTime: json["trip_time"] ?? "",
      createdAt: json["created_at"] ?? "",
    );
  }
}
