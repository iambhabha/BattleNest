// 📁 lib/stores/app_config_store.dart
import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tournament_app/constants/firestore_paths.dart';

part 'app_config_store.g.dart';

class AppConfigStore = _AppConfigStore with _$AppConfigStore;

abstract class _AppConfigStore with Store {
  @observable
  String? errorImageUrl;

  bool _isListening = false;

  @action
  void initConfig() {
    if (_isListening) return;

    FirebaseFirestore.instance.collection(FirestorePaths.config).doc(FirestorePaths.appSettings).snapshots().listen((
      snapshot,
    ) {
      errorImageUrl = snapshot.data()?['errorImageUrl'];
    });
    _isListening = true;
  }
}
