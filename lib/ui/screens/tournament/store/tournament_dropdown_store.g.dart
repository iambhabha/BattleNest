// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_dropdown_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TournamentDropdownStore on _TournamentDropdownStore, Store {
  late final _$gameModesAtom =
      Atom(name: '_TournamentDropdownStore.gameModes', context: context);

  @override
  ObservableList<DropdownItem> get gameModes {
    _$gameModesAtom.reportRead();
    return super.gameModes;
  }

  @override
  set gameModes(ObservableList<DropdownItem> value) {
    _$gameModesAtom.reportWrite(value, super.gameModes, () {
      super.gameModes = value;
    });
  }

  late final _$capacitiesAtom =
      Atom(name: '_TournamentDropdownStore.capacities', context: context);

  @override
  ObservableList<DropdownItem> get capacities {
    _$capacitiesAtom.reportRead();
    return super.capacities;
  }

  @override
  set capacities(ObservableList<DropdownItem> value) {
    _$capacitiesAtom.reportWrite(value, super.capacities, () {
      super.capacities = value;
    });
  }

  late final _$entryFeesAtom =
      Atom(name: '_TournamentDropdownStore.entryFees', context: context);

  @override
  ObservableList<DropdownItem> get entryFees {
    _$entryFeesAtom.reportRead();
    return super.entryFees;
  }

  @override
  set entryFees(ObservableList<DropdownItem> value) {
    _$entryFeesAtom.reportWrite(value, super.entryFees, () {
      super.entryFees = value;
    });
  }

  late final _$currenciesAtom =
      Atom(name: '_TournamentDropdownStore.currencies', context: context);

  @override
  ObservableList<DropdownItem> get currencies {
    _$currenciesAtom.reportRead();
    return super.currencies;
  }

  @override
  set currencies(ObservableList<DropdownItem> value) {
    _$currenciesAtom.reportWrite(value, super.currencies, () {
      super.currencies = value;
    });
  }

  late final _$stagesAtom =
      Atom(name: '_TournamentDropdownStore.stages', context: context);

  @override
  ObservableList<DropdownItem> get stages {
    _$stagesAtom.reportRead();
    return super.stages;
  }

  @override
  set stages(ObservableList<DropdownItem> value) {
    _$stagesAtom.reportWrite(value, super.stages, () {
      super.stages = value;
    });
  }

  late final _$fetchAllDropdownsAsyncAction = AsyncAction(
      '_TournamentDropdownStore.fetchAllDropdowns',
      context: context);

  @override
  Future<void> fetchAllDropdowns() {
    return _$fetchAllDropdownsAsyncAction.run(() => super.fetchAllDropdowns());
  }

  @override
  String toString() {
    return '''
gameModes: ${gameModes},
capacities: ${capacities},
entryFees: ${entryFees},
currencies: ${currencies},
stages: ${stages}
    ''';
  }
}
