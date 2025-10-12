class DoctorModel {
  final String id;
  final String name;
  final String specialization;
  final String qualification;
  final String experience;
  final String gender;
  final String photoUrl;
  final String about;
  final String hospitalId;
  final String hospitalName;
  final double consultationFee;
  final bool onlineConsultation;
  final bool homeVisit;
  final List<String> availableDays; // ["Mon", "Wed", "Fri"]
  final String availableFrom; // "10:00 AM"
  final String availableTo;   // "5:00 PM"
  final double rating;
  final int totalReviews;
  final bool isActive;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.qualification,
    required this.experience,
    required this.gender,
    required this.photoUrl,
    required this.about,
    required this.hospitalId,
    required this.hospitalName,
    required this.consultationFee,
    required this.onlineConsultation,
    required this.homeVisit,
    required this.availableDays,
    required this.availableFrom,
    required this.availableTo,
    required this.rating,
    required this.totalReviews,
    required this.isActive,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      qualification: json['qualification'] ?? '',
      experience: json['experience'] ?? '',
      gender: json['gender'] ?? '',
      photoUrl: json['photo_url'] ?? '',
      about: json['about'] ?? '',
      hospitalId: json['hospital_id'] ?? '',
      hospitalName: json['hospital_name'] ?? '',
      consultationFee: (json['consultation_fee'] ?? 0).toDouble(),
      onlineConsultation: json['online_consultation'] ?? false,
      homeVisit: json['home_visit'] ?? false,
      availableDays: List<String>.from(json['available_days'] ?? []),
      availableFrom: json['available_from'] ?? '',
      availableTo: json['available_to'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      totalReviews: json['total_reviews'] ?? 0,
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'qualification': qualification,
      'experience': experience,
      'gender': gender,
      'photo_url': photoUrl,
      'about': about,
      'hospital_id': hospitalId,
      'hospital_name': hospitalName,
      'consultation_fee': consultationFee,
      'online_consultation': onlineConsultation,
      'home_visit': homeVisit,
      'available_days': availableDays,
      'available_from': availableFrom,
      'available_to': availableTo,
      'rating': rating,
      'total_reviews': totalReviews,
      'is_active': isActive,
    };
  }
}
