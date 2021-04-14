import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:routeam_app/domain/model/media.dart';
import 'package:routeam_app/domain/repository/media_repository.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._mediaRepository);

  final MediaRepository _mediaRepository;

  @observable
  TextEditingController codeController = TextEditingController();

  @observable
  Media media;

  @observable
  bool isLoading = false;

  @action
  Future<void> getMedia({
    @required void Function({bool videoIsNull}) callback,
  }) async {
    if (codeController.text.trim().isNotEmpty) {
      isLoading = true;
      try {
        final code = codeController.text;
        final data = await _mediaRepository.getMedia(code: code);
        media = data;
        Future.delayed(
          Duration(seconds: 1),
          () => {
            callback(videoIsNull: media.video == null),
            codeController.clear(),
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
