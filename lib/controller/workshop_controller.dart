import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/respository/workshop_repository.dart';

final getWorkShopsByNameProvider = StreamProvider.family((ref, String query) {
  return ref
      .watch(workshopControllerProvider.notifier)
      .getWorkshopsByName(query);
});

final workshopControllerProvider =
    StateNotifierProvider<WorkshopController, bool>(
  (ref) {
    return WorkshopController(
      workshopRepository: ref.watch(workshopRepositoryProvider),
    );
  },
);

final workshopsProvider = StreamProvider<List<Workshop>>(
  (ref) {
    return ref.watch(workshopControllerProvider.notifier).getWorkshops();
  },
);

final workshopAttendeesProvider = StreamProvider.family(
  (ref, String workshopName) {
    return ref
        .watch(workshopControllerProvider.notifier)
        .getWorkshopAttendees(workshopName);
  },
);

class WorkshopController extends StateNotifier<bool> {
  final WorkshopRepository _workshopRepository;
  WorkshopController({required WorkshopRepository workshopRepository})
      : _workshopRepository = workshopRepository,
        super(false);

  Stream<List<Workshop>> getWorkshops() {
    return _workshopRepository.getWorkshops();
  }

  Stream<List<Workshop>> getWorkshopsByName(String query) {
    return _workshopRepository.getWorkshopsByName(query);
  }

  Stream<List<String>> getWorkshopAttendees(String workshopName) {
    return _workshopRepository.getWorkshopAttendees(workshopName);
  }
}
