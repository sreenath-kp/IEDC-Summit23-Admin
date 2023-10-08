import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/respository/attendee_repository.dart';

final getAttendeeByIDProvider = StreamProvider.family(
  (ref, String id) {
    return ref.watch(attendeeControllerProvider.notifier).getDatabyId(id);
  },
);

final presentCountProvider = StreamProvider<int>(
  (ref) {
    return ref.watch(attendeeRepositoryProvider).getPresentCount();
  },
);

final vegCountProvider = StreamProvider<int>(
  (ref) {
    return ref.watch(attendeeRepositoryProvider).getVegCount();
  },
);

final nonVegCountProvider = StreamProvider<int>(
  (ref) {
    return ref.watch(attendeeRepositoryProvider).getNonVegCount();
  },
);

final attendeeControllerProvider =
    StateNotifierProvider<AttendeeController, bool>(
  (ref) {
    return AttendeeController(
      attendeeRepository: ref.watch(attendeeRepositoryProvider),
      // ref: ref,
    );
  },
);

class AttendeeController extends StateNotifier<bool> {
  final AttendeeRepository _attendeeRepository;
  // final Ref _ref;
  AttendeeController({
    required AttendeeRepository attendeeRepository,
    // required Ref ref,
  })  : _attendeeRepository = attendeeRepository,
        // _ref = ref,
        super(false);

  Stream<Attendee> getDatabyId(String id) {
    return _attendeeRepository.getDatabyId(id);
  }

  Future<bool> addAttendence(Attendee attendee) async {
    try {
      bool result = await _attendeeRepository.addAttendence(attendee);
      if (result) {
        const SnackBar(
          content: Text("Success"),
        );
        return true;
      }
      const SnackBar(
        content: Text("Error"),
      );
      return false;
    } catch (e) {
      SnackBar(
        content: Text(e.toString()),
      );
      return false;
    }
  }
}
