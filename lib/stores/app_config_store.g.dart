// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppConfigStore on _AppConfigStore, Store {
  late final _$errorImageUrlAtom =
      Atom(name: '_AppConfigStore.errorImageUrl', context: context);

  @override
  String? get errorImageUrl {
    _$errorImageUrlAtom.reportRead();
    return super.errorImageUrl;
  }

  @override
  set errorImageUrl(String? value) {
    _$errorImageUrlAtom.reportWrite(value, super.errorImageUrl, () {
      super.errorImageUrl = value;
    });
  }

  late final _$_AppConfigStoreActionController =
      ActionController(name: '_AppConfigStore', context: context);

  @override
  void initConfig() {
    final _$actionInfo = _$_AppConfigStoreActionController.startAction(
        name: '_AppConfigStore.initConfig');
    try {
      return super.initConfig();
    } finally {
      _$_AppConfigStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorImageUrl: ${errorImageUrl}
    ''';
  }
}
