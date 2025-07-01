import 'package:mobx/mobx.dart';

part 'home_navigation_view_model.g.dart';

class HomeNavigationViewModel = _HomeNavigationViewModel with _$HomeNavigationViewModel;

abstract class _HomeNavigationViewModel with Store {
  @observable
  int selectedTabIndex = 0;

  @action
  void updateTabIndex(int index) {
    selectedTabIndex = index;
  }
}
