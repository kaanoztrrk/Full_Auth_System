enum ImageEnum { logo, google, apple }

extension ImageGenerator on ImageEnum {
  String get toPath => "asset/ic_$name.png";
}
