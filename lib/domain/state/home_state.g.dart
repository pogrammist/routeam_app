// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$codeControllerAtom = Atom(name: 'HomeStateBase.codeController');

  @override
  TextEditingController get codeController {
    _$codeControllerAtom.reportRead();
    return super.codeController;
  }

  @override
  set codeController(TextEditingController value) {
    _$codeControllerAtom.reportWrite(value, super.codeController, () {
      super.codeController = value;
    });
  }

  final _$mediaAtom = Atom(name: 'HomeStateBase.media');

  @override
  Media get media {
    _$mediaAtom.reportRead();
    return super.media;
  }

  @override
  set media(Media value) {
    _$mediaAtom.reportWrite(value, super.media, () {
      super.media = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

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

  final _$getMediaAsyncAction = AsyncAction('HomeStateBase.getMedia');

  @override
  Future<void> getMedia(
      {@required void Function({bool videoIsNull}) callback}) {
    return _$getMediaAsyncAction.run(() => super.getMedia(callback: callback));
  }

  @override
  String toString() {
    return '''
codeController: ${codeController},
media: ${media},
isLoading: ${isLoading}
    ''';
  }
}
