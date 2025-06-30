import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:tournament_app/constants/firestore_paths.dart';
import 'package:tournament_app/constants/tournament_dropdown_paths.dart';
import 'package:tournament_app/features/screens/tournament/models/dropdown_item.dart';

part 'tournament_dropdown_store.g.dart';

class TournamentDropdownStore = _TournamentDropdownStore
    with _$TournamentDropdownStore;

abstract class _TournamentDropdownStore with Store {
  final _firestore = FirebaseFirestore.instance;

  @observable
  ObservableList<DropdownItem> gameModes = ObservableList<DropdownItem>();

  @observable
  ObservableList<DropdownItem> capacities = ObservableList<DropdownItem>();

  @observable
  ObservableList<DropdownItem> entryFees = ObservableList<DropdownItem>();

  @observable
  ObservableList<DropdownItem> currencies = ObservableList<DropdownItem>();

  @observable
  ObservableList<DropdownItem> stages = ObservableList<DropdownItem>();

  @action
  Future<void> fetchAllDropdowns() async {
    await Future.wait([
      _fetchDropdown(TournamentDropdownPaths.gameModes, gameModes),
      _fetchDropdown(TournamentDropdownPaths.capacities, capacities),
      _fetchDropdown(TournamentDropdownPaths.entryFees, entryFees),
      _fetchDropdown(TournamentDropdownPaths.currencies, currencies),
      _fetchDropdown(TournamentDropdownPaths.stages, stages),
    ]);
  }

  Future<void> _fetchDropdown(
    String type,
    ObservableList<DropdownItem> targetList,
  ) async {
    final snap =
        await _firestore
            .collection(FirestorePaths.dropdownPath(type))
            .where('isDeleted', isEqualTo: false)
            .orderBy('id')
            .get();
    targetList.clear();
    targetList.addAll(
      snap.docs.map((doc) => DropdownItem.fromJson(doc.data())),
    );
  }
}
