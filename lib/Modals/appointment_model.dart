// Class Appointment{
//   final String id;
//   final String patientName;
//   final String hospitalName;
//   final DateTime appointmentDate;
//   final String doctorName;
//   final String reason;
//   final String status;

//   Appointment({
//     required this.id,
//     required this.patientName,
//     required this.appointmentDate,
//     required this.doctorName,
//     required this.reason,
//     required this.hospitalName,
//     required this.status,
//   });

//   factory Appointment.fromJson(Map<String, dynamic> json) {
//     return Appointment(
//       id: json['id'],
//       patientName: json['patientName'],
//       appointmentDate: DateTime.parse(json['appointmentDate']),
//       doctorName: json['doctorName'],
//       reason: json['reason'],
//       hospitalName: json['hospitalName'],
//       status: json['status'],
//     );
//   } 

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'patientName': patientName,
//       'appointmentDate': appointmentDate.toIso8601String(),
//       'doctorName': doctorName,
//       'reason': reason,
//       'hospitalName': hospitalName,
//       'status': status,
//     };
//   }
// }