// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_navigation_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeNavigationViewModel on _HomeNavigationViewModel, Store {
  late final _$selectedTabIndexAtom =
      Atom(name: '_HomeNavigationViewModel.selectedTabIndex', context: context);

  @override
  int get selectedTabIndex {
    _$selectedTabIndexAtom.reportRead();
    return super.selectedTabIndex;
  }

  @override
  set selectedTabIndex(int value) {
    _$selectedTabIndexAtom.reportWrite(value, super.selectedTabIndex, () {
      super.selectedTabIndex = value;
    });
  }

  late final _$_HomeNavigationViewModelActionController =
      ActionController(name: '_HomeNavigationViewModel', context: context);

  @override
  void updateTabIndex(int index) {
    final _$actionInfo = _$_HomeNavigationViewModelActionController.startAction(
        name: '_HomeNavigationViewModel.updateTabIndex');
    try {
      return super.updateTabIndex(index);
    } finally {
      _$_HomeNavigationViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedTabIndex: ${selectedTabIndex}
    ''';
  }
}
