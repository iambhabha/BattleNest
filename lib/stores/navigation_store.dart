import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setIndex(int index) {
    selectedIndex = index;
  }
}
