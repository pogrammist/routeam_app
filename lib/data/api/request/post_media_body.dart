import 'dart:io';

import 'package:meta/meta.dart';

class PostMediaBody {
  final File file;
  final String code;
  final int template;

  PostMediaBody({
    @required this.file,
    @required this.code,
    this.template = 1,
  });

  Map<String, dynamic> toApi() {
    return {
      'file': file,
      'code': code,
      'template': template,
    };
  }
}
