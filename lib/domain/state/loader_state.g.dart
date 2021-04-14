// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loader_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoaderState on LoaderStateBase, Store {
  final _$codeAtom = Atom(name: 'LoaderStateBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$pickedFileAtom = Atom(name: 'LoaderStateBase.pickedFile');

  @override
  File get pickedFile {
    _$pickedFileAtom.reportRead();
    return super.pickedFile;
  }

  @override
  set pickedFile(File value) {
    _$pickedFileAtom.reportWrite(value, super.pickedFile, () {
      super.pickedFile = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'LoaderStateBase.isLoading');

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

  final _$mediaAtom = Atom(name: 'LoaderStateBase.media');

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

  final _$getFileFromStorageAsyncAction =
      AsyncAction('LoaderStateBase.getFileFromStorage');

  @override
  Future<dynamic> getFileFromStorage() {
    return _$getFileFromStorageAsyncAction
        .run(() => super.getFileFromStorage());
  }

  final _$postMediaAsyncAction = AsyncAction('LoaderStateBase.postMedia');

  @override
  Future<void> postMedia({@required Function callback}) {
    return _$postMediaAsyncAction
        .run(() => super.postMedia(callback: callback));
  }

  @override
  String toString() {
    return '''
code: ${code},
pickedFile: ${pickedFile},
isLoading: ${isLoading},
media: ${media}
    ''';
  }
}
