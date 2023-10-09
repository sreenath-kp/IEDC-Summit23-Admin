import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summit_admin_app/models/workshop_model.dart';
import 'package:summit_admin_app/respository/workshop_repository.dart';

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

class WorkshopController extends StateNotifier<bool> {
  final WorkshopRepository _workshopRepository;
  WorkshopController({required WorkshopRepository workshopRepository})
      : _workshopRepository = workshopRepository,
        super(false);

  Stream<List<Workshop>> getWorkshops() {
    return _workshopRepository.getWorkshops();
  }
}
