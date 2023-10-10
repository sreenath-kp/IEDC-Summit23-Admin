// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:summit_admin_app/components/text_field_input.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/respository/attendee_repository.dart';
import 'package:summit_admin_app/respository/workshop_repository.dart';

class SpotAdmitScreen extends ConsumerStatefulWidget {
  final String wsName;
  const SpotAdmitScreen({
    super.key,
    required this.wsName,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SpotAdmitScreenState();
}

class _SpotAdmitScreenState extends ConsumerState<SpotAdmitScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _attendeeCategoryController =
      TextEditingController();
  final TextEditingController _collegeHasIEDCController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _foodPreferenceController =
      TextEditingController();
  final TextEditingController _emergencyContactController =
      TextEditingController();
  final TextEditingController _districtOfResidenceController =
      TextEditingController();
  final TextEditingController _iedcRegistrationTypeController =
      TextEditingController();
  final TextEditingController _iedcRegistrationNumberController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _genderController.dispose();
    _attendeeCategoryController.dispose();
    _collegeHasIEDCController.dispose();
    _addressController.dispose();
    _foodPreferenceController.dispose();
    _emergencyContactController.dispose();
    _districtOfResidenceController.dispose();
    _iedcRegistrationTypeController.dispose();
    _iedcRegistrationNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theAppBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                TextFieldInput(
                  cont: _iedcRegistrationNumberController,
                  hintTxt: "Enter TicketID",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldInput(
                  cont: _nameController,
                  hintTxt: "Enter Name",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldInput(
                  cont: _mobileController,
                  hintTxt: "Enter PhoneNo",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFieldInput(
                  cont: _emailController,
                  hintTxt: "Enter Email",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Attendee attendee = Attendee(
                          name: _nameController.text,
                          email: _emailController.text,
                          mobile: _mobileController.text,
                          gender: " ",
                          attendeeCategory: "Spot",
                          collegeHasIEDC: " ",
                          address: " ",
                          foodPreference: " ",
                          emergencyContact: "NA",
                          districtOfResidence: "NA",
                          iedcRegistrationType: "Spot",
                          iedcRegistrationNumber:
                              _iedcRegistrationNumberController.text,
                          isPresent: true,
                        );
                        ref
                            .watch(attendeeRepositoryProvider)
                            .uploadtoFirebase(attendee);
                        ref
                            .watch(workshopRepositoryProvider)
                            .addWorkshopAttendence(
                              widget.wsName,
                              attendee.iedcRegistrationNumber,
                            );
                        Navigator.of(context).pop();
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar theAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Add Attendence"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
