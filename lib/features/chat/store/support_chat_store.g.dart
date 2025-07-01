// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupportChatStore on _SupportChatStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SupportChatStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentChannelAtom =
      Atom(name: '_SupportChatStore.currentChannel', context: context);

  @override
  Channel? get currentChannel {
    _$currentChannelAtom.reportRead();
    return super.currentChannel;
  }

  @override
  set currentChannel(Channel? value) {
    _$currentChannelAtom.reportWrite(value, super.currentChannel, () {
      super.currentChannel = value;
    });
  }

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

  late final _$showTypingIndicatorAtom =
      Atom(name: '_SupportChatStore.showTypingIndicator', context: context);

  @override
  bool get showTypingIndicator {
    _$showTypingIndicatorAtom.reportRead();
    return super.showTypingIndicator;
  }

  @override
  set showTypingIndicator(bool value) {
    _$showTypingIndicatorAtom.reportWrite(value, super.showTypingIndicator, () {
      super.showTypingIndicator = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_SupportChatStore.init', context: context);

  @override
  Future<void> init(String userId) {
    return _$initAsyncAction.run(() => super.init(userId));
  }

  late final _$disposeAsyncAction =
      AsyncAction('_SupportChatStore.dispose', context: context);

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_SupportChatStoreActionController =
      ActionController(name: '_SupportChatStore', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SupportChatStoreActionController.startAction(
        name: '_SupportChatStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SupportChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTyping(bool value) {
    final _$actionInfo = _$_SupportChatStoreActionController.startAction(
        name: '_SupportChatStore.setTyping');
    try {
      return super.setTyping(value);
    } finally {
      _$_SupportChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentChannel: ${currentChannel},
connected: ${connected},
showTypingIndicator: ${showTypingIndicator}
    ''';
  }
}
