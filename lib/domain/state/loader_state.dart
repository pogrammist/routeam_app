import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:routeam_app/domain/model/media.dart';
import 'package:routeam_app/domain/repository/media_repository.dart';

part 'loader_state.g.dart';

class LoaderState = LoaderStateBase with _$LoaderState;

abstract class LoaderStateBase with Store {
  LoaderStateBase(this._mediaRepository);

  final MediaRepository _mediaRepository;

  @observable
  String code;

  @observable
  File pickedFile;

  @observable
  bool isLoading = false;

  @observable
  Media media;

  @action
  Future getFileFromStorage() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        withData: true,
        type: FileType.video,
      );
      if (result.files.single.size == 0) {
        throw "File too large";
      } else {
        pickedFile = File(result.files.single.path);
      }
    } catch (e) {
      print("Can't pick file");
      print(e);
    }
  }

  @action
  Future<void> postMedia({@required Function callback}) async {
    if (pickedFile != null && !isLoading) {
      isLoading = true;
      try {
        final data = await _mediaRepository.postMedia(
          file: pickedFile,
          code: code,
          template: 1,
        );
        media = data;
        print("media -- ${media.video}");
        print("media -- ${media.code}");
        if (media != null)
          Future.delayed(
            Duration(seconds: 1),
            () => {
              callback(),
              pickedFile = null,
              media = null,
            },
          );
      } catch (err) {
        print(err);
      }
      isLoading = false;
    }
  }
}
