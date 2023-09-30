import 'dart:convert';

class Attendee {
  final String name;
  final String email;
  final String mobile;
  final String gender;
  final String attendeeCategory;
  final String collegeHasIEDC;
  final String address;
  final String foodPreference;
  final String emergencyContact;
  final String districtOfResidence;
  final String iedcRegistrationType;
  final String iedcRegistrationNumber;
  
  Attendee({
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.attendeeCategory,
    required this.collegeHasIEDC,
    required this.address,
    required this.foodPreference,
    required this.emergencyContact,
    required this.districtOfResidence,
    required this.iedcRegistrationType,
    required this.iedcRegistrationNumber,
  });

  Attendee copyWith({
    String? name,
    String? email,
    String? mobile,
    String? gender,
    String? attendeeCategory,
    String? collegeHasIEDC,
    String? address,
    String? foodPreference,
    String? emergencyContact,
    String? districtOfResidence,
    String? iedcRegistrationType,
    String? iedcRegistrationNumber,
  }) {
    return Attendee(
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      gender: gender ?? this.gender,
      attendeeCategory: attendeeCategory ?? this.attendeeCategory,
      collegeHasIEDC: collegeHasIEDC ?? this.collegeHasIEDC,
      address: address ?? this.address,
      foodPreference: foodPreference ?? this.foodPreference,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      districtOfResidence: districtOfResidence ?? this.districtOfResidence,
      iedcRegistrationType: iedcRegistrationType ?? this.iedcRegistrationType,
      iedcRegistrationNumber: iedcRegistrationNumber ?? this.iedcRegistrationNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'attendeeCategory': attendeeCategory,
      'collegeHasIEDC': collegeHasIEDC,
      'address': address,
      'foodPreference': foodPreference,
      'emergencyContact': emergencyContact,
      'districtOfResidence': districtOfResidence,
      'iedcRegistrationType': iedcRegistrationType,
      'iedcRegistrationNumber': iedcRegistrationNumber,
    };
  }

  factory Attendee.fromMap(Map<String, dynamic> map) {
    return Attendee(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      mobile: map['mobile'] ?? '',
      gender: map['gender'] ?? '',
      attendeeCategory: map['attendeeCategory'] ?? '',
      collegeHasIEDC: map['collegeHasIEDC'] ?? '',
      address: map['address'] ?? '',
      foodPreference: map['foodPreference'] ?? '',
      emergencyContact: map['emergencyContact'] ?? '',
      districtOfResidence: map['districtOfResidence'] ?? '',
      iedcRegistrationType: map['iedcRegistrationType'] ?? '',
      iedcRegistrationNumber: map['iedcRegistrationNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Attendee.fromJson(String source) => Attendee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Attendee(name: $name, email: $email, mobile: $mobile, gender: $gender, attendeeCategory: $attendeeCategory, collegeHasIEDC: $collegeHasIEDC, address: $address, foodPreference: $foodPreference, emergencyContact: $emergencyContact, districtOfResidence: $districtOfResidence, iedcRegistrationType: $iedcRegistrationType, iedcRegistrationNumber: $iedcRegistrationNumber)';
  }


}



// Gender
// Male
// Mobile Number (Whatsapp no preferred)
// +911425367894
// Attendee category
// Student
// My college has IEDC
// No
// Address
// Trivandrum
// Food preference
// Veg
// Emergency contact
// +911234567890
// District of residence
// Kannur
// Rahul Das P
// tve21cs109@cet.ac.in
// IEDC Registration
// INR
// 11854457