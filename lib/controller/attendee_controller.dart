import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/respository/attendee_repository.dart.dart';

final getAttendeeByIDProvider = StreamProvider.family(
  (ref, String id) {
    return ref.watch(attendeeControllerProvider.notifier).getDatabyId(id);
  },
);

final attendeeControllerProvider =
    StateNotifierProvider<AttendeeController, bool>((ref) {
  return AttendeeController(
      attendeeRepository: ref.watch(attendeeRepositoryProvider), ref: ref);
});

class AttendeeController extends StateNotifier<bool> {
  final AttendeeRepository _attendeeRepository;
  final Ref _ref;
  AttendeeController({
    required AttendeeRepository attendeeRepository,
    required Ref ref,
  })  : _attendeeRepository = attendeeRepository,
        _ref = ref,
        super(false);

  Stream<Attendee> getDatabyId(String id) {
    return _attendeeRepository.getDatabyId(id);
  }
}
