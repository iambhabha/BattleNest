import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tournament_app/constants/firestore_paths.dart';

part 'app_config_store.g.dart';

class AppConfigStore = _AppConfigStore with _$AppConfigStore;

abstract class _AppConfigStore with Store {
  @observable
  String? errorImageUrl;

  @observable
  bool isFetched = false;

  @action
  Future<void> fetchErrorImageUrl() async {
    if (isFetched) return;

    final doc =
        await FirebaseFirestore.instance.collection(FirestorePaths.config).doc(FirestorePaths.appSettings).get();

    errorImageUrl = doc.data()?['errorImageUrl'];
    isFetched = true;
  }

  // Optional: Live listener (Firestore snapshot)
  void startLiveUpdates() {
    FirebaseFirestore.instance.collection(FirestorePaths.config).doc(FirestorePaths.appSettings).snapshots().listen((
      snapshot,
    ) {
      errorImageUrl = snapshot.data()?['errorImageUrl'];
    });
  }
}
