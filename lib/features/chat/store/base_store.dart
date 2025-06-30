import 'package:mobx/mobx.dart';

part 'base_store.g.dart'; // Make sure file is named base_store.dart

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;
}
