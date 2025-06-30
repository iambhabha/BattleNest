// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatStore on _ChatStore, Store {
  late final _$connectedAtom =
      Atom(name: '_ChatStore.connected', context: context);

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  late final _$connectUserAsyncAction =
      AsyncAction('_ChatStore.connectUser', context: context);

  @override
  Future<void> connectUser(String userId) {
    return _$connectUserAsyncAction.run(() => super.connectUser(userId));
  }

  late final _$createOrJoinSupportChannelAsyncAction =
      AsyncAction('_ChatStore.createOrJoinSupportChannel', context: context);

  @override
  Future<void> createOrJoinSupportChannel(String userId) {
    return _$createOrJoinSupportChannelAsyncAction
        .run(() => super.createOrJoinSupportChannel(userId));
  }

  @override
  String toString() {
    return '''
connected: ${connected}
    ''';
  }
}
