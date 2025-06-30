// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeContentStore on _HomeContentStore, Store {
  late final _$sectionsAtom =
      Atom(name: '_HomeContentStore.sections', context: context);

  @override
  ObservableList<SectionModel> get sections {
    _$sectionsAtom.reportRead();
    return super.sections;
  }

  @override
  set sections(ObservableList<SectionModel> value) {
    _$sectionsAtom.reportWrite(value, super.sections, () {
      super.sections = value;
    });
  }

  late final _$fetchSectionsAsyncAction =
      AsyncAction('_HomeContentStore.fetchSections', context: context);

  @override
  Future<void> fetchSections() {
    return _$fetchSectionsAsyncAction.run(() => super.fetchSections());
  }

  @override
  String toString() {
    return '''
sections: ${sections}
    ''';
  }
}
