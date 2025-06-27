// 📁 lib/stores/app_config_store.dart
import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'app_config_store.g.dart';

class AppConfigStore = _AppConfigStore with _$AppConfigStore;

abstract class _AppConfigStore with Store {
  @observable
  String? errorImageUrl;

  bool _isListening = false;

  @action
  void initConfig() {
    if (_isListening) return;

    FirebaseFirestore.instance.collection('config').doc('app_settings').snapshots().listen((snapshot) {
      errorImageUrl = snapshot.data()?['errorImageUrl'];
    });

    _isListening = true;
  }
}
