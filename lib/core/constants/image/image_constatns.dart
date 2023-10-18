class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get logo => toPng('login');

  String get login => toPng('l');

  String toPng(String name) => 'assets/image/$name.png';
}
