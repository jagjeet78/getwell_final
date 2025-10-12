import 'package:getwell_go/Modals/doctormodel.dart';



class HospitalModel {
  final String id;
  final String name;
  final String type; // "Hospital" | "Clinic"
  final String address;
  final String contactNumber;
  final String email;
  final String photoUrl;
  final String coverImage;
  final String description;
  final double rating;
  final bool isVerified;
  final List<String> facilities;
  final List<String> specialties;
  final List<DoctorModel> doctors; // ✅ doctors list inside hospital

  HospitalModel({
    required this.id,
    required this.name,
    required this.type,
    required this.address,
    required this.contactNumber,
    required this.email,
    required this.photoUrl,
    required this.coverImage,
    required this.description,
    required this.rating,
    required this.isVerified,
    required this.facilities,
    required this.specialties,
    required this.doctors,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? 'Clinic',
      address: json['address'] ?? '',
      contactNumber: json['contact_number'] ?? '',
      email: json['email'] ?? '',
      photoUrl: json['photo_url'] ?? '',
      coverImage: json['cover_image'] ?? '',
      description: json['description'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      isVerified: json['is_verified'] ?? false,
      facilities: List<String>.from(json['facilities'] ?? []),
      specialties: List<String>.from(json['specialties'] ?? []),
      doctors: (json['doctors'] as List<dynamic>? ?? [])
          .map((doc) => DoctorModel.fromJson(doc))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'address': address,
      'contact_number': contactNumber,
      'email': email,
      'photo_url': photoUrl,
      'cover_image': coverImage,
      'description': description,
      'rating': rating,
      'is_verified': isVerified,
      'facilities': facilities,
      'specialties': specialties,
      'doctors': doctors.map((doc) => doc.toJson()).toList(),
    };
  }
}
