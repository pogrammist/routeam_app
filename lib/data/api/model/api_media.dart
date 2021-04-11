class ApiMedia {
  String video;
  String code;
  int template;

  ApiMedia.fromApi(Map<String, dynamic> map) {
    video = map['video'];
    code = map['code'];
    template = map['template'];
  }
}
