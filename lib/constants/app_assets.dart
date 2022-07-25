abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();


  final String logo = 'assets/images/bitmap/logo.png';
  final String background = 'assets/images/bitmap/background.png';
}

class _Svg {
  const _Svg();
  final String logo = 'assets/images/svg/logo.svg';
  final String account = 'assets/images/svg/account.svg';
  final String password = 'assets/images/svg/password.svg';
}
