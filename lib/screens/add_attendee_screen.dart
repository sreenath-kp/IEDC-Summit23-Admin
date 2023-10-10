import 'package:flutter/material.dart';

class AddAttendeeScreen extends StatefulWidget {
  const AddAttendeeScreen({Key? key}) : super(key: key);

  @override
  _AddAttendeeScreenState createState() => _AddAttendeeScreenState();
}

class _AddAttendeeScreenState extends State<AddAttendeeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attendee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Add attendee to workshop
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Attendee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:convert';

// import 'package:flutter/material.dart';

// class AddAttendeeScreen extends StatefulWidget {
//   const AddAttendeeScreen({Key? key}) : super(key: key);

//   @override
//   _AddAttendeeScreenState createState() => _AddAttendeeScreenState();
// }

// class _AddAttendeeScreenState extends State<AddAttendeeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _email = '';
//   String _mobile = '';
//   String _gender = '';
//   String _attendeeCategory = '';
//   String _collegeHasIEDC = '';
//   String _address = '';
//   String _foodPreference = '';
//   String _emergencyContact = '';
//   String _districtOfResidence = '';
//   String _iedcRegistrationType = '';
//   String _iedcRegistrationNumber = '';
//   bool _isPresent = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Attendee'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _name = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Mobile',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a mobile number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _mobile = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Gender',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a gender';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _gender = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Attendee Category',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an attendee category';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _attendeeCategory = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'College has IEDC',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter whether the college has IEDC';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _collegeHasIEDC = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Address',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an address';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _address = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Food Preference',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a food preference';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _foodPreference = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Emergency Contact',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an emergency contact';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _emergencyContact = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'District of Residence',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a district of residence';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _districtOfResidence = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'IEDC Registration Type',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an IEDC registration type';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _iedcRegistrationType = value!;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'IEDC Registration Number',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter an IEDC registration number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _iedcRegistrationNumber = value!;
//                 },
//               ),
//               SwitchListTile(
//                 title: Text('Is Present'),
//                 value: _isPresent,
//                 onChanged: (value) {
//                   setState(() {
//                     _isPresent = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     final attendee = Attendee(
//                       name: _name,
//                       email: _email,
//                       mobile: _mobile,
//                       gender: _gender,
//                       attendeeCategory: _attendeeCategory,
//                       collegeHasIEDC: _collegeHasIEDC,
//                       address: _address,
//                       foodPreference: _foodPreference,
//                       emergencyContact: _emergencyContact,
//                       districtOfResidence: _districtOfResidence,
//                       iedcRegistrationType: _iedcRegistrationType,
//                       iedcRegistrationNumber: _iedcRegistrationNumber,
//                       isPresent: _isPresent,
//                     );
//                     // TODO: Add attendee to workshop
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Add Attendee'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Attendee {
//   final String name;
//   final String email;
//   final String mobile;
//   final String gender;
//   final String attendeeCategory;
//   final String collegeHasIEDC;
//   final String address;
//   final String foodPreference;
//   final String emergencyContact;
//   final String districtOfResidence;
//   final String iedcRegistrationType;
//   final String iedcRegistrationNumber;
//   final bool isPresent;

//   Attendee({
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.gender,
//     required this.attendeeCategory,
//     required this.collegeHasIEDC,
//     required this.address,
//     required this.foodPreference,
//     required this.emergencyContact,
//     required this.districtOfResidence,
//     required this.iedcRegistrationType,
//     required this.iedcRegistrationNumber,
//     required this.isPresent,
//   });

//   Attendee copyWith({
//     String? name,
//     String? email,
//     String? mobile,
//     String? gender,
//     String? attendeeCategory,
//     String? collegeHasIEDC,
//     String? address,
//     String? foodPreference,
//     String? emergencyContact,
//     String? districtOfResidence,
//     String? iedcRegistrationType,
//     String? iedcRegistrationNumber,
//     bool? isPresent,
//   }) {
//     return Attendee(
//       name: name ?? this.name,
//       email: email ?? this.email,
//       mobile: mobile ?? this.mobile,
//       gender: gender ?? this.gender,
//       attendeeCategory: attendeeCategory ?? this.attendeeCategory,
//       collegeHasIEDC: collegeHasIEDC ?? this.collegeHasIEDC,
//       address: address ?? this.address,
//       foodPreference: foodPreference ?? this.foodPreference,
//       emergencyContact: emergencyContact ?? this.emergencyContact,
//       districtOfResidence: districtOfResidence ?? this.districtOfResidence,
//       iedcRegistrationType: iedcRegistrationType ?? this.iedcRegistrationType,
//       iedcRegistrationNumber:
//           iedcRegistrationNumber ?? this.iedcRegistrationNumber,
//       isPresent: isPresent ?? this.isPresent,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'email': email,
//       'mobile': mobile,
//       'gender': gender,
//       'attendeeCategory': attendeeCategory,
//       'collegeHasIEDC': collegeHasIEDC,
//       'address': address,
//       'foodPreference': foodPreference,
//       'emergencyContact': emergencyContact,
//       'districtOfResidence': districtOfResidence,
//       'iedcRegistrationType': iedcRegistrationType,
//       'iedcRegistrationNumber': iedcRegistrationNumber,
//       'isPresent': isPresent,
//     };
//   }

//   factory Attendee.fromMap(Map<String, dynamic> map) {
//     return Attendee(
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       mobile: map['mobile'] ?? '',
//       gender: map['gender'] ?? '',
//       attendeeCategory: map['attendeeCategory'] ?? '',
//       collegeHasIEDC: map['collegeHasIEDC'] ?? '',
//       address: map['address'] ?? '',
//       foodPreference: map['foodPreference'] ?? '',
//       emergencyContact: map['emergencyContact'] ?? '',
//       districtOfResidence: map['districtOfResidence'] ?? '',
//       iedcRegistrationType: map['iedcRegistrationType'] ?? '',
//       iedcRegistrationNumber: map['iedcRegistrationNumber'] ?? '',
//       isPresent: map['isPresent'] ?? false,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Attendee.fromJson(String source) =>
//       Attendee.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Attendee(name: $name, email: $email, mobile: $mobile, gender: $gender, attendeeCategory: $attendeeCategory, collegeHasIEDC: $collegeHasIEDC, address: $address, foodPreference: $foodPreference, emergencyContact: $emergencyContact, districtOfResidence: $districtOfResidence, iedcRegistrationType: $iedcRegistrationType, iedcRegistrationNumber: $iedcRegistrationNumber, isPresent: $isPresent)';
//   }
// }