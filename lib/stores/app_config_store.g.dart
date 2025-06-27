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

  late final _$isFetchedAtom =
      Atom(name: '_AppConfigStore.isFetched', context: context);

  @override
  bool get isFetched {
    _$isFetchedAtom.reportRead();
    return super.isFetched;
  }

  @override
  set isFetched(bool value) {
    _$isFetchedAtom.reportWrite(value, super.isFetched, () {
      super.isFetched = value;
    });
  }

  late final _$fetchErrorImageUrlAsyncAction =
      AsyncAction('_AppConfigStore.fetchErrorImageUrl', context: context);

  @override
  Future<void> fetchErrorImageUrl() {
    return _$fetchErrorImageUrlAsyncAction
        .run(() => super.fetchErrorImageUrl());
  }

  @override
  String toString() {
    return '''
errorImageUrl: ${errorImageUrl},
isFetched: ${isFetched}
    ''';
  }
}
