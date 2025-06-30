// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupportChatStore on _SupportChatStore, Store {
  late final _$connectedAtom =
      Atom(name: '_SupportChatStore.connected', context: context);

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

  late final _$initAsyncAction =
      AsyncAction('_SupportChatStore.init', context: context);

  @override
  Future<void> init(String userId) {
    return _$initAsyncAction.run(() => super.init(userId));
  }

  @override
  String toString() {
    return '''
connected: ${connected}
    ''';
  }
}
